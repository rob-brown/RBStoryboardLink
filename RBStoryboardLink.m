//
//  RBStoryboardLink.m
//  LinkedStoryboards
//
//  Created by Robert Brown on 6/10/12.
//  Copyright (c) 2012 Robert Brown. All rights reserved.
//

#import "RBStoryboardLink.h"


@interface RBStoryboardLink ()

/// The contained view controller from the other 
@property (nonatomic, strong) UIViewController * scene;

@end


@implementation RBStoryboardLink

@synthesize storyboardName  = _storyboardName;
@synthesize sceneIdentifier = _sceneIdentifier;
@synthesize scene           = _scene;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert([self.storyboardName length], @"No storyboard name");
    
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:self.storyboardName bundle:nil];
    UIViewController * scene = nil;
    
    // Creates the linked scene.
    if ([self.sceneIdentifier length] == 0)
        scene = [storyboard instantiateInitialViewController];
    else
        scene = [storyboard instantiateViewControllerWithIdentifier:self.sceneIdentifier];
    
    NSAssert(scene, 
             @"No scene found in storyboard: \"%@\" with optional identifier: \"%@\"", 
             self.storyboardName, 
             self.sceneIdentifier);
    
    self.scene = scene;
    
    // Adjusts the frame of the child view.
    CGRect frame = self.view.frame;
    CGRect linkedFrame = scene.view.frame;
    linkedFrame.origin.x -= frame.origin.x;
    linkedFrame.origin.y -= frame.origin.y;
    
    // The scene's main view must be made flexible so it will resize properly 
    // in the container. 
    scene.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | 
                                   UIViewAutoresizingFlexibleHeight);
    
    scene.view.frame = linkedFrame;
    
    // Adds the view controller as a child view.
    [self addChildViewController:scene];
    [self.view addSubview:scene.view];
    [scene didMoveToParentViewController:self];
    
    // Grabs the UINavigationItem stuff.
    UINavigationItem * navItem = self.navigationItem;
    UINavigationItem * linkedNavItem = scene.navigationItem;
    navItem.title = linkedNavItem.title;
    navItem.titleView = linkedNavItem.titleView;
    navItem.prompt = linkedNavItem.prompt;
    navItem.hidesBackButton = linkedNavItem.hidesBackButton;
    navItem.backBarButtonItem = linkedNavItem.backBarButtonItem;
    navItem.rightBarButtonItem = linkedNavItem.rightBarButtonItem;
    navItem.rightBarButtonItems = linkedNavItem.rightBarButtonItems;
    navItem.leftBarButtonItem = linkedNavItem.leftBarButtonItem;
    navItem.leftBarButtonItems = linkedNavItem.leftBarButtonItems;
    navItem.leftItemsSupplementBackButton = linkedNavItem.leftItemsSupplementBackButton;
    
    // Grabs the UITabBarItem
    // The link overrides the contained view's tab bar item.
    if (self.tabBarController)
        scene.tabBarItem = self.tabBarItem;
    
    // Grabs the edit button.
    UIBarButtonItem * editButton = self.editButtonItem;
    UIBarButtonItem * linkedEditButton = scene.editButtonItem;
    
    if (linkedEditButton) {
        
        editButton.enabled = linkedEditButton.enabled;
        editButton.image = linkedEditButton.image;
        editButton.landscapeImagePhone = linkedEditButton.landscapeImagePhone;
        editButton.imageInsets = linkedEditButton.imageInsets;
        editButton.landscapeImagePhoneInsets = linkedEditButton.landscapeImagePhoneInsets;
        editButton.title = linkedEditButton.title;
        editButton.tag = linkedEditButton.tag;
        editButton.target = linkedEditButton.target;
        editButton.action = linkedEditButton.action;
        editButton.style = linkedEditButton.style;
        editButton.possibleTitles = linkedEditButton.possibleTitles;
        editButton.width = linkedEditButton.width;
        editButton.customView = linkedEditButton.customView;
        editButton.tintColor = linkedEditButton.tintColor;
    }
    
    // Grabs the modal properties.
    self.modalTransitionStyle = scene.modalTransitionStyle;
    self.modalPresentationStyle = scene.modalPresentationStyle;
    self.definesPresentationContext = scene.definesPresentationContext;
    self.providesPresentationContextTransitionStyle = scene.providesPresentationContextTransitionStyle;
    
    // Grabs the popover properties.
    self.contentSizeForViewInPopover = scene.contentSizeForViewInPopover;
    self.modalInPopover = scene.modalInPopover;
    
    // Grabs miscellaneous properties.
    self.title = scene.title;
    self.hidesBottomBarWhenPushed = scene.hidesBottomBarWhenPushed;
    self.editing = scene.editing;
    self.wantsFullScreenLayout = scene.wantsFullScreenLayout;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    
    // The linked scene defines the rotation. 
    return [self.scene shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

@end
