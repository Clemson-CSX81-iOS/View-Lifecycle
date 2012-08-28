//
//  ViewController.m
//  View Livecycle
//
//  Created by DJ Edmonson on 6/18/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import "MyViewController.h"

@implementation MyViewController

#pragma mark - Property Syntheses
@synthesize button1 = _button1;
@synthesize button2 = _button2;
@synthesize lastButton = _lastButton;


#pragma mark - Methods

/** Method returns true if the view is allowed to rotate to an orientaion
 @param interfaceOrientation The orientation the view might rotate to.
 @return Yes if view will rotate, No if not.
 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark View Livecycle Methods

/** This method is called after the view controller is loaded into memory.
 Is used for additional setup of the view at load-time
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View Did Load");
}

/** This method is called right before the view is shown on screen.
 Is used to show created items and finnish setting up subviews
 because the view has it size properties now.
 @param animated BOOL value letting you know if the view will be shown
 with animation or not.
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"View Will Appear animated: %@",animated?@"YES":@"NO");
}

/** This method is called after the view has appeared on the screen.
 Is used if you need to display something on the screen after the view
 is visible like animations.
 @param animated BOOL value letting you know if the view appeared in an
 animation.
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"View Did Appear animated: %@",animated?@"YES":@"NO");
}

/** This method is called right before the view will be hidden or removed.
 This is used to stop any visual affects by the view becuase it is will no
 longer be visible.
 @param animated BOOL value that lets you know if the view will be dismissed
 with an animation.
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"View Will Disappear animated: %@",animated?@"YES":@"NO");
}

/** This method is called right after the view has finnished being hidden or removed.
 This is used to release high memory objects so that you do not waste memory while
 the view is not visible.
 */
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"View Did Disappear animated: %@",animated?@"YES":@"NO");
}

/** This method is called right before the view is removed from the view hierarchy.
 It is use it to commit editing changes, resign the first responder status of
 the view, or perform other relevant tasks.
 */
- (void)viewWillUnload {
    [super viewWillUnload];
    NSLog(@"View Will Unload");
}

/** This method is called after the view is removed from the view hierarchy.
 It is used to release data that can be easily recreated when the view is
 loaded again.
 */
- (void)viewDidUnload {
    [super viewDidUnload];
    NSLog(@"View Did Unload");
}

#pragma mark - UI Actions

/** This method is used to switch which button is shown.
 This is done by keeping an internal var that lets you
 choose which button is shown or hidden.
 */
- (void)switchButton {
    //ToDo
}



#pragma mark - Dealloc

-(void)dealloc{
    // dealloc is required when not using ARC
    NSLog(@"View Dealloc");
    [self.button1 release];
    [self.button2 release];
    [super dealloc];
}

@end
