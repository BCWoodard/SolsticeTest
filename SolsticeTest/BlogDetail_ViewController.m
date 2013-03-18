//
//  BlogDetail_ViewController.m
//  SolsticeTest
//
//  Created by Brad Woodard on 3/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "BlogDetail_ViewController.h"

// To convert the article content string from HTML to plain text, I'm using an existing
// category from the publicly available MWFeedParser called "NSString+HTML" so that needs
// to be imported
#import "NSString+HTML.h"

@interface BlogDetail_ViewController ()

@end

@implementation BlogDetail_ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the titleLabel equal to articleTitle property of the selected blog article
    self.titleLabel.text = _incomingBlogEntry.articleTitle; 
    
    // Set the dateLabel equal to articleDate property of the selected blog article
    self.dateLabel.text = _incomingBlogEntry.articleDate;
    
    // Use the HTML converter from MWFeedParse to convert HTML content to plain text
    self.articleTextView.text = [_incomingBlogEntry.articleContent stringByConvertingHTMLToPlainText];
    
    // Set the title in the nav bar with the article title
    self.title = _incomingBlogEntry.articleTitle;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MODAL VIEW CONFIGURATION
// If a user wants to view the article as a web page, they can select the button "View as a Web Page" to load the modal view
// The segue to the modal view is configured in storyboard and is linked from the button to the modal view controller
// so selecting the button will fire the prepareForSegue method and load the modal view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // The segue is linked directly from the button and is defined in Xcode as "toWebView"
    if ([segue.identifier isEqualToString:@"toWebView"]) {
        
        // In order to pass data between view controllers, BlogDetail_ViewController needs to know
        // that WebView_ViewController exists
        WebView_ViewController *webViewController = [segue destinationViewController];
        
        // Assign the object for incomingURL on the WebView_ViewController to the corresponding object
        // on BlogDetail_ViewController
        webViewController.incomingURL = _incomingBlogEntry.articleURL;
    }
}

@end
