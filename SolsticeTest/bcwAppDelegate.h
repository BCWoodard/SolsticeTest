//
//  bcwAppDelegate.h
//  SolsticeTest
//
//  Created by Brad Woodard on 3/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Reachability; // Declare 

@interface bcwAppDelegate : UIResponder <UIApplicationDelegate>
{
    Reachability *internetReach;
}

@property (strong, nonatomic) UIWindow *window;

@end
