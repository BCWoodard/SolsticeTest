//
//  BlogEntry.h
//  SolsticeTest
//
//  Created by Brad Woodard on 3/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//
//  BlogEntry is a subclass of NSObject. It will store the information we capture from
//  the blog feed using XMLParser

#import <Foundation/Foundation.h>

@interface BlogEntry : NSObject

// Declare the elements we want to pull from the feed for display
// I'm making them mutable strings because some trimming and appending will occur as they are grabbed from the feed.
@property (strong, nonatomic) NSMutableString *articleTitle; // The title of the article
@property (strong, nonatomic) NSMutableString *articleContent; // The content of the article in HTML format (will be converted later).
@property (strong, nonatomic) NSMutableString *articleURL; // The URL for viewing the article in a browser
@property (strong, nonatomic) NSMutableString *articleDate; // The published date (as a string) of the article

@end
