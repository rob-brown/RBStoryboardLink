//
//  LSRandomNumberViewController.m
//  LinkedStoryboards
//
//  Created by Robert Brown on 6/10/12.
//  Copyright (c) 2012 Robert Brown. All rights reserved.
//

#import "LSRandomNumberViewController.h"


@interface LSRandomNumberViewController ()

@property (strong, nonatomic) IBOutlet UILabel *randomNumberLabel;

@end


@implementation LSRandomNumberViewController

@synthesize randomNumberLabel = _randomNumberLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self randomNumberLabel] setText:@""];
}

- (void)viewDidUnload {
    [self setRandomNumberLabel:nil];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)showRandomNumber:(id)sender {
    [[self randomNumberLabel] setText:[NSString stringWithFormat:@"%d", arc4random()]];
}

@end
