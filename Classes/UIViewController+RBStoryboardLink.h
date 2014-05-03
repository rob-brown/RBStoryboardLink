//
// UIViewController+RBStoryboardLink.h
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
