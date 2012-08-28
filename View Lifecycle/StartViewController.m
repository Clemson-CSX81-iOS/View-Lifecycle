//
//  StartViewController.m
//  View Lifecycle
//
//  Created by Douglas Edmonson on 08/28/2012.
//  Copyright (c) 2012 Clemson. All rights reserved.
//

#import "StartViewController.h"

@implementation StartViewController


/*
 * Do not wory about the stuff in this file. It will be covered later.
 */

- (IBAction)animated:(id)sender {
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"vc1"]
                                         animated:YES];
}

- (IBAction)notAnimated:(id)sender {
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"vc1"]
                                         animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
