//
//  LTSecondViewController.m
//  LinkedTabs
//
//  Created by Robert Brown on 6/10/12.
//  Copyright (c) 2012 Robert Brown. All rights reserved.
//

#import "LTSecondViewController.h"


@interface LTSecondViewController ()

@property (nonatomic, assign) NSUInteger badgeNumber;

@end


@implementation LTSecondViewController

@synthesize badgeNumber = _badgeNumber;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)incrementBadge:(id)sender {
    
    self.badgeNumber++;
    
    [[self tabBarItem] setBadgeValue:[NSString stringWithFormat:@"%u", self.badgeNumber]];
}

@end
