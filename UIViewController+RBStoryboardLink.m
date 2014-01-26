//
//  UIViewController+RBStoryboardLink.m
//  Pods
//
//  Created by Robert Brown on 1/25/14.
//
//

#import "UIViewController+RBStoryboardLink.h"
#import "RBStoryboardLink.h"

@implementation UIViewController (RBStoryboardLink)

- (RBStoryboardLink *)rbsl_storyboardLink {
    
    if ([self isKindOfClass:[RBStoryboardLink class]])
        return (RBStoryboardLink *)self;
    
    return [self.parentViewController rbsl_storyboardLink];
}

- (UIViewController *)rbsl_targetViewController {
    return [self rbsl_storyboardLink] ?: self;
}

@end
