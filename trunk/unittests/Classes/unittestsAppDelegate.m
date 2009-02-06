//
//  unittestsAppDelegate.m
//  unittests
//
//  Created by Matthias Grundmann on 2/6/09.
//  Copyright Matthias Grundmann 2009. All rights reserved.
//

#import "unittestsAppDelegate.h"

@implementation unittestsAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	window_ = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
	
	
	// Setup main textbox to display test results.
	text_view_ = [[UITextView alloc] initWithFrame:[[UIScreen mainScreen] 
												   applicationFrame]];
	
	text_view_.editable = NO;
	text_view_.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:12];

	// Override point for customization after application launch
	[window_ addSubview:text_view_];
    [window_ makeKeyAndVisible];
}


- (void)dealloc {
	[text_view_ release];
    [window_ release];
    [super dealloc];
}


@end
