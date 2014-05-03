# RBStoryboardLink

## Summary

`UIStoryboards` are very powerful and useful. However, to make the best use of storyboards, they need to be broken down into natural modules. The problem with having many storyboards is writing the code to transition between them. `RBStoryboardLink` solves this problem by allowing "pseudo-segues" between `UIStoryboards`. These segues can be built without leaving Interface Builder and without writing any extra code.

## Dependencies

`RBStoryboardLink` requires iOS 7.0+. With some modifications it can support iOS 6 as well, but I wanted to keep it simple. `RBStoryboardLink` cannot simultaneously support iOS 5 and 7 due to the large functionality differences.

## How to use

**NOTE:** As of 0.1.0, there is a new workflow. The old workflow only used `RBStoryboardLink`. It was responsible for all the work by acting as a proxy for the real view controller. In the new workflow, `RBStoryboardLink` merely provides information for `RBStoryboardSegue`. `RBStoryboardSegue` redirects the segue on presentation. This redirection avoids the complexity of `UIViewController` containment and dereferencing a proxy in methods such as `-prepareForSegue:sender:`. The new workflow is thanks to [@MBulli][3].

1. Your app's storyboards must first be decomposed into their natural modules. See this [guide][1] for some tips.

2. Where ever you want create a transition into a different storyboard, create a `UIViewController` representing the scene to be pushed.

3. Create the desired segue type (Push, Modal, Custom) to these surrogate view controllers. To take advantage of the new linking, set the type to custom and choose one of `RBStoryboardPushSegue`, `RBStoryboardModalSegue`, or `RBStoryboardPopoverSegue`. You may also create subclasses of `RBStoryboardSegue` for custom transitions. 

4. In the Identity Inspector, change the class type of each surrogate view controller to `RBStoryboardLink`.

5. While still in the Identity Inspector, add one or more User Defined Runtime Attributes.

    1. storyboardName (Required) The name of the storyboard to transition into.
    2. sceneIdentifier (Optional) The identifier of the view controller to transition to. If left blank, this will push the first view controller.
    3. needsTopLayoutGuide (Optional) Whether a custom layout constraint should be added to the top layout guide in storyboards. If you notice the background of your navigation bar not getting behind the status bar, set this to `NO`. This property is unused if using one of the `RBStoryboardSegue`s.
    4. needsBottomLayoutGuide (Optional) Same as the one on top, but for the bottom guide. This property is unused if using one of the `RBStoryboardSegue`s.

## Implementation notes

* When using a `UITabBarController` with `UINavcontroller`s in the tabs. Place the `UINavigationController`s in the same storyboard as the `UITabBarController`.

## Demos

There are two demos that are provided to show how to use `RBStoryboardLink`:

* A standard, straightforward workflow.

* A tabbed workflow.

## Contribution

Contributions are welcomed. I'm much more responsive to pull requests rather than issues. The sample apps use [KIF][2] for automated testing. Any pull requests must pass the tests before they will be merged. If new functionality is introduced, the pull requests must also add tests for the new behavior.

## License

`RBStoryboardLink` is licensed under the MIT license, which is reproduced in its entirety here:

>Copyright (c) 2012-2014 Robert Brown
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
  [2]: https://github.com/kif-framework/KIF
  [3]: https://github.com/MBulli
