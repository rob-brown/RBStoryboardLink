//
//  LTTests.m
//  LinkedTabs
//
//  Created by Robert Brown on 11/9/13.
//  Copyright (c) 2013 Robert Brown. All rights reserved.
//

#import <KIF/KIF.h>


@interface LTTests : KIFTestCase

@end


@implementation LTTests

- (void)testNavigation {
    
    // Test tabs
    [tester waitForViewWithAccessibilityLabel:@"First Tab"];
    [tester tapViewWithAccessibilityLabel:@"Second"];
    [tester waitForViewWithAccessibilityLabel:@"Second Tab"];
    [tester tapViewWithAccessibilityLabel:@"First"];
    [tester waitForViewWithAccessibilityLabel:@"First Tab"];
    
    // Test navigation.
    [tester tapViewWithAccessibilityLabel:@"Next"];
    [tester waitForViewWithAccessibilityLabel:@"Nav Controller works."];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    [tester waitForViewWithAccessibilityLabel:@"Another view controller"];
    [tester tapViewWithAccessibilityLabel:@"Next"];
    [tester waitForViewWithAccessibilityLabel:@"Try tapping the selected tab to go back to the first view controller"];
    
    // Test pop to root.
    [tester tapViewWithAccessibilityLabel:@"First"];
    [tester waitForViewWithAccessibilityLabel:@"First Tab"];
    
    // Test tab badge.
    [tester tapViewWithAccessibilityLabel:@"Second"];
    [tester waitForViewWithAccessibilityLabel:@"Second Tab"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"1"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"2"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"3"];
    [tester tapViewWithAccessibilityLabel:@"Increment Badge"];
    [tester waitForViewWithAccessibilityLabel:@"1"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"2"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"3"];
    [tester tapViewWithAccessibilityLabel:@"Increment Badge"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"1"];
    [tester waitForViewWithAccessibilityLabel:@"2"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"3"];
    [tester tapViewWithAccessibilityLabel:@"Increment Badge"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"1"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"2"];
    [tester waitForViewWithAccessibilityLabel:@"3"];
}

@end
