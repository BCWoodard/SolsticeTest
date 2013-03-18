//
//  XMLParser.h
//  SolsticeTest
//
//  Created by Brad Woodard on 3/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//
//  The XMLParser scans the XML feed and parses out the data we want for the app, creates an object of type BlogEntry
//  and inserts those objects into a mutable array

#import <Foundation/Foundation.h>
#import "BlogEntry.h"  // Import the BlogEntry object

@interface XMLParser : NSObject <NSXMLParserDelegate> // Extend the XMLParser as a delegate in order to interact with the view

@property (strong, readonly) NSMutableArray *blogEntries; // An array of blog entries that is built by the parser as it iterates thru the feed


- (id)loadXMLfromURL:(NSString *)urlString; // A method that reads the XML and parses it 

@end
