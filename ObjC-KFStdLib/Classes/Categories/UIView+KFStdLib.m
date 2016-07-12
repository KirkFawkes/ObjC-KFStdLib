//
//  UIView+KFStdLib.m
//
//  Copyright © 2016 Igor. All rights reserved.
//

#import "UIView+KFStdLib.h"

@implementation UIView (KFStdLib)

+ (instancetype)kf_loadViewFromNib
{
	NSString *nibName = NSStringFromClass([self class]);
	UIView *view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] firstObject];
	
	NSAssert(view != nil, @"View in nib not found");
	
	return view;
}

@end
