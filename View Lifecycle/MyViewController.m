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

/** This method is used to switch which button is shown.
    This is done by keeping an internal var that lets you
    choose which button is shown or hidden.
 */
- (void)switchButton {
    if (self.lastButton == 0) {
        // This used standard method calling to set properties
        [self.button1 setHidden:YES];
        [self.button2 setHidden:NO];
        self.lastButton = 1;
    }
    else if(self.lastButton == 1) {
        // This uses built in dot notation to call the setters
        self.button1.hidden = NO;
        self.button2.hidden = YES;
        self.lastButton = 0;
    }
}


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
    
    self.lastButton = 0;
    
    //Initalize the buttons with a factory method and retain the object
    self.button1 = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    self.button2 = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    
    //Setup the target as self and the action to send to the target
    // when the event happens
    [self.button1 addTarget:self   //The target is who the message is sent to
                 action:@selector(switchButton) // Selectors are a referance to a method
       forControlEvents:UIControlEventTouchUpInside]; // This is a constant for when the touch
                                                      //  event ends while still in the button.
    
    [self.button2 addTarget:self 
                 action:@selector(switchButton) 
       forControlEvents:UIControlEventTouchUpInside];
    
    //At this point the buttons are in memory and have there actions but
    // are not visible.
}

/** This method is called right before the view is shown on screen.
    Is used to show created items and finnish setting up subviews 
    because the view has it size properties now.
 @param animated BOOL value letting you know if the view will be shown
                    with animation or not.
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.button1.frame = CGRectMake(110, 143, 100, 40); //The frame is a rectangle specified with
    self.button2.frame = CGRectMake(110, 276, 100, 40); // x,y,width,height
    
    //Adding the buttons as a subview adds them to the screen
    [self.view addSubview:self.button1]; 
    [self.view addSubview:self.button2]; 
}

/** This method is called after the view has appeared on the screen.
    Is used if you need to display something on the screen after the view
    is visible like animations.
 @param animated BOOL value letting you know if the view appeared in an 
                    animation.
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    [self.button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    
    self.button2.hidden = YES;
}

/** This method is called right before the view will be hidden or removed.
    This is used to stop any visual affects by the view becuase it is will no
    longer be visible.
 @param animated BOOL value that lets you know if the view will be dismissed
                    with an animation.
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.button1.hidden = NO;
    self.button2.hidden = NO;
    
    [self.button1 setTitle:@"1" forState:UIControlStateNormal]; 
    [self.button2 setTitle:@"2" forState:UIControlStateNormal];
}

/** This method is called right after the view has finnished being hidden or removed.
    This is used to release high memory objects so that you do not waste memory while
    the view is not visible.
 */
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Because the buttons are no longer needed they can be removed.
    [self.button1 removeFromSuperview];
    [self.button2 removeFromSuperview];
}

/** This method is called right before the view is removed from the view hierarchy.
    It is use it to commit editing changes, resign the first responder status of 
    the view, or perform other relevant tasks.
 */
- (void)viewWillUnload {
    [super viewWillUnload];
}

/** This method is called after the view is removed from the view hierarchy.
    It is used to release data that can be easily recreated when the view is 
    loaded again.
 */
- (void)viewDidUnload {
    [super viewDidUnload];
    
    // Examples of releasing the buttons because the setter will release the old values
    self.button1 = nil;
    [self setButton2:nil]; // We Should use dot notation here becuase we are accessing a property
}

#pragma mark - Dealloc

-(void)dealloc{
    // dealloc is required when not using ARC
    [self.button1 release];
    [self.button2 release];
    [super dealloc];
}

@end
