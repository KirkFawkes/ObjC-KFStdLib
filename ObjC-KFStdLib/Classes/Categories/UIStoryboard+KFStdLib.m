//
//  UIStoryboard+KFStdLib.m
//
//  Copyright © 2016 Igor. All rights reserved.
//

#import "UIStoryboard+KFStdLib.h"

@implementation UIStoryboard (KFStdLib)

+ (UIViewController *)kf_viewControllerWithIdentifier:(NSString *)identifier fromStoryboardName:(NSString *)storyboardName
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
	return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

@end
