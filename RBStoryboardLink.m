//
// RBStoryboardLink.m
//
// Copyright (c) 2012 Robert Brown
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "RBStoryboardLink.h"


@interface RBStoryboardLink ()

@property (nonatomic, strong, readwrite) id scene;

@end


@implementation RBStoryboardLink

@synthesize storyboardName  = _storyboardName;
@synthesize sceneIdentifier = _sceneIdentifier;
@synthesize scene           = _scene;

- (void)awakeFromNib {
    [super awakeFromNib];
    
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // adds the scene's view
    [self.view addSubview:[self.scene view]];
    [self.scene didMoveToParentViewController:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    
    // The linked scene defines the rotation. 
    return [self.scene shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (BOOL)shouldAutorotate {

    // The linked scene defines autorotate.
    return [self.scene shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations {

    // The linked scene defines supported orientations.
    return [self.scene supportedInterfaceOrientations];
}
@end
