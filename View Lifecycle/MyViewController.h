//
//  ViewController.h
//  View Livecycle
//
//  Created by DJ Edmonson on 6/18/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (assign, nonatomic) NSInteger lastButton;


- (void)switchButton;

@end
