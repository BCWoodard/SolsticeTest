//
//  WebView_ViewController.m
//  SolsticeTest
//
//  Created by Brad Woodard on 3/17/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "WebView_ViewController.h"

@interface WebView_ViewController ()

@end

@implementation WebView_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - LOAD THE VIEW
// Want to load the view and populate the webView
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // We have to pass the incoming URL to the webView so it knows what page to load
    // Declare an object type of NSURL and define it
    // Set the argument to a URLWithString, format and pass the incoming URL string
    NSURL *articleUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", _incomingURL]];
    
    // Declare an object type of NSURLRequest and pass that our NRURL object (articleURL)
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:articleUrl];
     
    // Pass our NSURLRequest to the webView so it can be loaded
    [_webView loadRequest:httpRequest];
    
    self.title = @"Blog on the Web";
}

#pragma mark - USER EXPERIENCE TWEAKS: ACTIVITY INDICATOR
// Want to set up an activity indicator so the user knows the web page is still loading.
// The indicator will appear while the web page is loading in the view and will disappear
// once the load is completed.
// 1. webViewDidStartLoad
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // Animate the activity indicator when the webView STARTS loading
    [_activityIndicator startAnimating];
}

// 2. webViewDidFinishLoad
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // Stop the activity indicator once the webView has FINISHED loading the page
    [_activityIndicator stopAnimating];
    _activityIndicator.hidden = TRUE; // HideS the activity indicator (can also be checked in Xcode)
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DISMISS MODAL VIEW CONTROLLER
// Need to provide a way for the user to dismiss the modal view when they have finished reading
- (IBAction)dismissWebView:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
