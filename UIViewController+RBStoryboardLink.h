//
//  UIViewController+RBStoryboardLink.h
//  Pods
//
//  Created by Robert Brown on 1/25/14.
//
//

#import <UIKit/UIKit.h>

@class RBStoryboardLink;


@interface UIViewController (RBStoryboardLink)

/// Returns the storyboard link this view controller is contained in, if any.
- (RBStoryboardLink *)rbsl_storyboardLink;

/**
 * If the view controller is within a storyboard link, the link is returned.
 * If not, `self` is returned. The intent is to access certain visual elements 
 * (such as `toolbarItems`) on the proper view controller when it's unknown if 
 * the view controller is contained in a link.
 */
- (UIViewController *)rbsl_targetViewController;

@end
