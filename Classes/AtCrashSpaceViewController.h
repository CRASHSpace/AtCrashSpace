//
//  AtCrashSpaceViewController.h
//  AtCrashSpace
//
//  Created by CARLA COLE on 11/4/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AtCrashSpaceViewController : UIViewController {
	IBOutlet UIWebView *webView;
	IBOutlet UITextField *theID;
	IBOutlet UITextField *theMSG;
	IBOutlet UISlider *timeSlider;
	IBOutlet UILabel *minutes;
}

- (IBAction) checkIn:(id)sender;
- (IBAction) doRefresh:(id)sender;
- (IBAction) sliderUpdate:(id)sender;

@end

