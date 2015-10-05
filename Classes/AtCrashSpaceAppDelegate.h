//
//  AtCrashSpaceAppDelegate.h
//  AtCrashSpace
//
//  Created by CARLA COLE on 11/4/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AtCrashSpaceViewController;

@interface AtCrashSpaceAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AtCrashSpaceViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AtCrashSpaceViewController *viewController;

@end

