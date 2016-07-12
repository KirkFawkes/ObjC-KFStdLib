//
//  UIStoryboard+KFStdLib.h
//
//  Copyright © 2016 Igor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (KFStdLib)

+ (UIViewController *)kf_viewControllerWithIdentifier:(NSString *)identifier fromStoryboardName:(NSString *)storyboardName;

@end
