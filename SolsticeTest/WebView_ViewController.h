//
//  WebView_ViewController.h
//  SolsticeTest
//
//  Created by Brad Woodard on 3/17/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

// The WebView_ViewController receives the actual URL of the blog post (found in the XML feed) and sends that to
// a webView so it can be displayed.


#import <UIKit/UIKit.h>

@interface WebView_ViewController : UIViewController <UIWebViewDelegate>
// Must set as a web view delegate so the UIWebView can talk to our activity indicator

@property (strong, nonatomic) NSString *incomingURL; // A property to which we will pass the articleURL from the BlogDetail_ViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView; // The webView that will load the article from feedburner.com
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator; // Inform the user that the web page is loading

- (IBAction)dismissWebView:(UIBarButtonItem *)sender; // Dismiss the modal view and return to the detail view when user is finished

@end
