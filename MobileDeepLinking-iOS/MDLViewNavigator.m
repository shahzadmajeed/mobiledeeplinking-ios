// Copyright (C) 2013 by MobileDeepLinking.org
//
// Permission is hereby granted, free of charge, to any
// person obtaining a copy of this software and
// associated documentation files (the "Software"), to
// deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the
// Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall
// be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <UIKit/UIKit.h>
#import "MDLViewNavigator.h"


@implementation MDLViewNavigator

@synthesize rootViewController = _rootViewController;

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super init];
    if (self)
    {
        _rootViewController = rootViewController;
    }
    return self;
}

- (void)showViewController:(UIViewController*)viewController
{
//    UIViewController *frontViewController = [self frontViewController];
    
    if ([_rootViewController isKindOfClass:[UINavigationController class]])
    {
        [((UINavigationController *) _rootViewController) pushViewController:viewController animated:YES];
    }
    else if ([_rootViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)_rootViewController;
        if (tabBarController.selectedViewController)
        {
            [((UINavigationController *) tabBarController.selectedViewController) pushViewController:viewController animated:YES];

        } else
        {
            [((UINavigationController *) [tabBarController.viewControllers objectAtIndex:0]) pushViewController:viewController animated:YES];
        }
    }
    else
    {
        [[UIApplication sharedApplication] keyWindow].rootViewController = viewController;
    }
}


@end