//
//  BlogDetail_ViewController.h
//  SolsticeTest
//
//  Created by Brad Woodard on 3/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//
// The BlogDetail_ViewController displays the post title, date published, links to the post on the website and displays the article
// content as plain text.


#import <UIKit/UIKit.h>

// Import the BlogEntry object so its properties and methods are available to the view controller
#import "BlogEntry.h" 

// Import the BlogList_TableViewController so we can communicate and pass data back and forth
#import "BlogList_TableViewController.h" 

// Import the WebView_ViewController so we can communicate and pass data back and forth
#import "WebView_ViewController.h" 

@interface BlogDetail_ViewController : UIViewController


@property (strong, nonatomic) BlogEntry *incomingBlogEntry; // Create space for the incoming blog object
@property (strong, nonatomic) NSString *articleHTML; // Declare a property to receive the article content in HTML in preparation for conversion to plain text
@property (weak, nonatomic) IBOutlet UILabel *titleLabel; // Create a label for the article title
@property (weak, nonatomic) IBOutlet UILabel *dateLabel; // Create a label for the article date
@property (weak, nonatomic) IBOutlet UITextView *articleTextView; // Text view for displaying the converted article HTML as text

@end