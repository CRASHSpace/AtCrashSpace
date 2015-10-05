//
//  main.m
//  AtCrashSpace
//
//  Created by CARLA COLE on 11/4/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
//    int retVal = UIApplicationMain(argc, argv, nil, @"AtCrashSpaceAppDelegate");
    [pool release];
    return retVal;
}
