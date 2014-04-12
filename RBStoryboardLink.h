//
// RBStoryboardLink.h
//
// Copyright (c) 2012-2014 Robert Brown
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

#import <UIKit/UIKit.h>

/**
 * Basically, what this class does is create a linked scene, put it in a
 * containter view controller, and copy all the linked scene's properties into
 * the container view controller.
 */
@interface RBStoryboardLink : UIViewController

/// The contained UIViewController from the destination view controller.
@property (nonatomic, strong, readonly) UIViewController * scene;

/// The name of the storyboard that should be linked.
/// This should be set in the Interface Builder identity inspector.
@property (nonatomic, copy) NSString * storyboardName;

/// (Optional) The identifier of the scene to show.
/// This should be set in the Interface Builder identity inspector.
@property (nonatomic, copy) NSString * sceneIdentifier;

/// (Optional) Whether the first view controller should have a constraint for
/// the top layout guide in the storyboard. This should be set in the Interface
/// Builder identity inspector.
@property (nonatomic, assign) BOOL needsTopLayoutGuide;

/// (Optional) Whether the first view controller should have a constraint for
/// the bottom layout guide in the storyboard. This should be set in the
/// Interface Builder identity inspector.
@property (nonatomic, assign) BOOL needsBottomLayoutGuide;

@end
