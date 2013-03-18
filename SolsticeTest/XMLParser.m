//
//  XMLParser.m
//  SolsticeTest
//
//  Created by Brad Woodard on 3/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

NSMutableString *currentNodeContent; // Will hold the data found in a node of the XML feed
NSXMLParser     *parser; // The XML parser used to extract data from the feed
BlogEntry       *currentArticle; // An object of type BlogEntry
NSString        *currentElement; // The element that is being processed


// We need to load the XML from a URL and create an array of objects from the retrieved data
- (id)loadXMLfromURL:(NSString *)urlString
{
    //Allocate space and initialize an array for storing BlogEntry objects retrieved from the feed
    _blogEntries = [[NSMutableArray alloc] init];

    // Create a pointer to the URL from which data will be retrieved
    NSURL *feedURL = [NSURL URLWithString:urlString];
    
    // Create a pointer to the data that will be pulled from the URL and allocate space and initialize
    NSData *blogData = [[NSData alloc] initWithContentsOfURL:feedURL];
    
    // Allocate and initialize the parser with the data from the URL
    parser = [[NSXMLParser alloc] initWithData:blogData];
    
    // Set the parser delegate to self
    parser.delegate = self;
    
    // Begin parsing data
    [parser parse];
    
    // Return 
    return self;
}

#pragma mark - XML Feed Consumption

// When we extend the object with <NSXMLParserDelegate>, the following 3 methods are required.
// 1. didStartElement
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // This method looks for the defined element in the XML feed (e.g. <entry>) and allocates space for a new BlogEntry object each time it finds the element name
    currentElement = elementName;  // set the currentElement string equal to the elementName being parsed
    currentNodeContent = [NSMutableString new]; // Create a new mutable string for each node found
    if ([elementName isEqualToString:@"entry"]) {  // Every time the parser finds an entry, it will allocate space for that blog object
        currentArticle = [BlogEntry alloc];
    }
}


// 2. foundCharacters
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // Look at each node in the XML feed and determine what to do with it
    // Because the title can have unusual characters (For example, "OH S*&% Is My...") and the content is in HTML format,
    // we want to be sure that the parser reads the entire node and doesn't stop mid-read. To do that, I append the string
    // until the parser finds the end tag in the node. If the current node is neither "content" nor "title", then I just
    // trim white space and new lines from the string.
    if ([currentElement isEqualToString:@"content"] || [currentElement isEqualToString:@"title"]) {
        [currentNodeContent appendString:string]; // Append string until the parser finds the closing tag (e.g. </content> and </title>)
    } else {
        currentNodeContent = (NSMutableString *)[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //remove white space and new lines from the data found in the current node. Because currentNodeContent is defined as a mutable string, I need to cast the data pulled from the feed as a mutable string.
    }
}

// 3. didEndElement
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //  Looks for the ending element of each node and then sets the content it found between the tags and assigns it to the corresponding property on our BlogEntry object (e.g. currentArticle) 
    if ([elementName isEqualToString:@"title"]) {
        currentArticle.articleTitle = currentNodeContent; // Set the title for the current article
    } else if ([elementName isEqualToString:@"content"]) {
        currentArticle.articleContent = currentNodeContent; // Set the content for the current article
    } else if ([elementName isEqualToString:@"feedburner:origLink"]) {
        currentArticle.articleURL = currentNodeContent; // Set the URL for the current article
    } else if ([elementName isEqualToString:@"published"]) {
        currentArticle.articleDate = currentNodeContent; // Set the date for the current article
    }

    if ([elementName isEqualToString:@"entry"]) {
        // If we're reading from the <entry> node in the XML add currentArticle to the mutable array blogEntries
        [_blogEntries addObject:currentArticle];
        
        currentArticle = nil;  // set the current article to nil to ensure that we don't inadvertently overwrite
    }
    currentNodeContent = nil; // set the current node to nil to ensure we don't inadvertently carryover values from one entry to the next
}



@end
