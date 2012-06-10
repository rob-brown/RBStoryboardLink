//
//  LSHelloViewController.m
//  LinkedStoryboards
//
//  Created by Robert Brown on 6/10/12.
//  Copyright (c) 2012 Robert Brown. All rights reserved.
//

#import "LSHelloViewController.h"


@interface LSHelloViewController ()

@property (strong, nonatomic) IBOutlet UILabel * helloLabel;

@end


@implementation LSHelloViewController

@synthesize helloLabel = _helloLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self helloLabel] setText:@""];
}

- (void)viewDidUnload {
    [self setHelloLabel:nil];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)sayHello:(id)sender {
    [[self helloLabel] setText:@"Hello"];
}

@end
