//
//  BlogList_TableViewController.h
//  SolsticeTest
//
//  Created by Brad Woodard on 3/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//
// The BlogList_TableViewController will 

#import <UIKit/UIKit.h>
#import "XMLParser.h"  // Need to import XMLParser so we can pass it the URL for the blog feed
#import "BlogEntry.h" // Must import in order to gain access to the Object properties and methods
#import "BlogDetail_ViewController.h" // Must import in order to communicate and pass data


@interface BlogList_TableViewController : UITableViewController

@end
