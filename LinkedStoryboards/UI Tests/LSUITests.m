//
//  LSUITests.m
//  LinkedStoryboards
//
//  Created by Robert Brown on 11/9/13.
//  Copyright (c) 2013 Robert Brown. All rights reserved.
//

#import <KIF/KIF.h>

#import "KIFTestCase.h"


@interface LSUITests : KIFTestCase

@end


@implementation LSUITests

- (void)testNavigation {
    
    // Test Hello view.
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Hello"];
    [tester tapViewWithAccessibilityLabel:@"Say Hello"];
    [tester waitForViewWithAccessibilityLabel:@"Hello"];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    
    // Test Random number view
    [tester waitForViewWithAccessibilityLabel:@"Random Number"];
    [tester tapViewWithAccessibilityLabel:@"Random Number"];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    
    // Test crossing storyboards
    [tester waitForViewWithAccessibilityLabel:@"The storyboard link worked."];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    
    // Test unwind.
    [tester waitForViewWithAccessibilityLabel:@"Yep, definitely in the other storyboard."];
    [tester tapViewWithAccessibilityLabel:@"Unwind"];
    [tester waitForViewWithAccessibilityLabel:@"Unwind worked!"];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    [tester tapViewWithAccessibilityLabel:@"Modal"];
    
    // Test modal view.
    [tester waitForViewWithAccessibilityLabel:@"This view has been presented modaly"];
    [tester tapViewWithAccessibilityLabel:@"Done"];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    [tester waitForViewWithAccessibilityLabel:@"This label has not been set."];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    
    // Test unwind across storyboards.
    [tester waitForViewWithAccessibilityLabel:@"Go to the next view to test unwind segues crossing storyboards."];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    [tester tapViewWithAccessibilityLabel:@"Unwind"];
    [tester waitForViewWithAccessibilityLabel:@"Unwind worked!"];
    
    // Test navigating back.
    [tester tapViewWithAccessibilityLabel:@"Second"];
    [tester waitForViewWithAccessibilityLabel:@"Random Number"];
    [tester tapViewWithAccessibilityLabel:@"First"];
    [tester waitForViewWithAccessibilityLabel:@"Hello"];
}

@end
