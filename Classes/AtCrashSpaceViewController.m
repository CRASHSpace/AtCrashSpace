//
//  AtCrashSpaceViewController.m
//  AtCrashSpace
//
//  Created by CARLA COLE on 11/4/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AtCrashSpaceViewController.h"

@implementation AtCrashSpaceViewController

- (void) sliderUpdate: (id) sender{
	
	int iMinutes = floor(timeSlider.value/15)*15;
	minutes.text = [NSString stringWithFormat: @"Minutes: %d", iMinutes];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

- (void) checkIn: (id) sender{
	
	int iMinutes = floor(timeSlider.value/15)*15;
	
	if([theID.text length] ==0){
		NSLog(@"Check in attempt NO ID failed!");
	}
	else{
		NSString *encodedID = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)theID.text, NULL,
																					CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
		// no MSG
		if([theMSG.text length]==0)
		{
			NSString *checkInURL = [[NSString alloc] initWithFormat:@"http://crashspacela.com/sign/?id=%@&diff_mins_max=%d&type=iphoneapp",
									encodedID,iMinutes];
			[webView loadRequest:[NSURLRequest	requestWithURL:[NSURL URLWithString:checkInURL]]];
			
			
			NSLog(@"Check in no MSG: %@",checkInURL);
			[checkInURL release];
			
		}
		// MSG
		else {
			NSString *encodedMSG = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)theMSG.text, NULL,
				CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
			
			NSLog(@"Trying to check in with MSG...");
			NSString *checkInURL = [[NSString alloc] initWithFormat:@"http://crashspacela.com/sign/?id=%@&diff_mins_max=%d&msg=%@&type=iphoneapp",
									encodedID,iMinutes,encodedMSG];
			NSLog(@"Check in with MSG: %@",checkInURL);
			[webView loadRequest:[NSURLRequest	requestWithURL:[NSURL URLWithString:checkInURL]]];

			[checkInURL release];
			[encodedMSG release];
		}
		NSLog(@"Checked in");
		[encodedID release];
	}
}

- (void) doRefresh: (id) sender{
	[webView loadRequest:[NSURLRequest	requestWithURL:[NSURL URLWithString:@"http://crashspacela.com/sign/"]]];
	NSLog(@"Refreshed");
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	int iMinutes = floor(timeSlider.value/15)*15;
	minutes.text = [NSString stringWithFormat: @"Minutes: %d", iMinutes];
	
	[webView loadRequest:[NSURLRequest	requestWithURL:[NSURL URLWithString:@"http://crashspacela.com/sign/"]]];
	NSLog(@"loaded first web page");
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (YES);
}
*/


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
