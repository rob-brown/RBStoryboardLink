//
// RBStoryboardSegue.m
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

#import "RBStoryboardSegue.h"
#import "RBStoryboardLink.h"


@implementation RBStoryboardSegue

+ (UIViewController *)viewControllerFromLink:(RBStoryboardLink *)link {
    
    NSParameterAssert(link);
    
    // Grabs the user-defined runtime attributes.
    NSString * storyboardName = [(RBStoryboardLink *)link storyboardName];
    NSString * storyboardID = [(RBStoryboardLink *)link sceneIdentifier];
    
    NSAssert(storyboardName, @"Unable to load linked storyboard. RBStoryboardLink storyboardName is nil. Forgot to set attribute in interface builder?");
    
    // Creates new destination.
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    if ([storyboardID length] == 0) {
        return [storyboard instantiateInitialViewController];
    }
    else {
        return [storyboard instantiateViewControllerWithIdentifier:storyboardID];
    }
}

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    NSAssert([destination isKindOfClass:[RBStoryboardLink class]], @"RBStoryboardSegue can only be used with a RBStoryboardLink as seque destination.");
    
    UIViewController * newDestination = [[self class] viewControllerFromLink:(RBStoryboardLink *)destination];
    
    if ((self = [super initWithIdentifier:identifier source:source destination:newDestination])) {
        _animated = YES;
    }
    
    return self;
}

@end
