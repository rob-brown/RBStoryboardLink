//
//  RBStoryboardLink.h
//  LinkedStoryboards
//
//  Created by Robert Brown on 6/10/12.
//  Copyright (c) 2012 Robert Brown. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RBStoryboardLink : UIViewController

/// The name of the storyboard that should be linked.
/// This should be set in the Interface Builder identity inspector.
@property (nonatomic, copy) NSString * storyboardName;

/// (Optional) The identifier of the scene to show. 
/// This should be set in the Interface Builder identity inspector.
@property (nonatomic, copy) NSString * sceneIdentifier;

@end
