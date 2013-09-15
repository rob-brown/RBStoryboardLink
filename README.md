#RBStoryboardLink

##Summary

`UIStoryboards` are very powerful and useful. However, to make the best use of storyboards, they need to be broken down into natural modules. The problem with having many storyboards is writing the code to transition between them. `RBStoryboardLink` solves this problem by allowing "pseudo-segues" between `UIStoryboards`. These segues can be built without leaving Interface Builder and without writing any extra code. 

##Dependencies

`RBStoryboardLink` requires iOS 5.0+ for `UIStoryboards` and `UIViewController` Containment. Unwind segues require iOS 6.0+.

##How to use

1. Your app's storyboards must first be decomposed into their natural modules. See this [guide][1] for some tips. 

2. Where ever you want create a transition into a different storyboard, create a `UIViewController` representing the scene to be pushed. 

3. Create the desired segue type (Push, Modal, Custom) to these surrogate view controllers. 

4. In the Identity Inspector, change the class type of each surrogate view controller to `RBStoryboardLink`.

5. While still in the Identity Inspector, add one or two User Defined Runtime Attributes. 

  1. storyboardName (Required) The name of the storyboard to transition into.
  
  2. sceneIdentifier (Optional) The identifier of the view controller to transition to. If left blank, this will push the first view controller. 

##Demos

There are two demos that are provided to show how to use `RBStoryboardLink`:

1. A standard, straightforward workflow. 

2. A tabbed workflow. 

##License

`RBStoryboardLink` is licensed under the MIT license, which is reproduced in its entirety here:

>Copyright (c) 2012-2013 Robert Brown
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
>of this software and associated documentation files (the "Software"), to deal
>in the Software without restriction, including without limitation the rights
>to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>copies of the Software, and to permit persons to whom the Software is
>furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in
>all copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>THE SOFTWARE.

  [1]: http://robsprogramknowledge.blogspot.com/2012/01/uistoryboard-best-practices.html
