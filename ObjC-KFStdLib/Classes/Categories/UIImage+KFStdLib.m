//
//  UIImage+KFStdLib.m
//
//  Copyright © 2016 Igor. All rights reserved.
//

#import "UIImage+KFStdLib.h"

@implementation UIImage (KFStdLib)

+ (UIImage *)kf_imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
	UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
	[image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

+ (UIImage *)kf_imageWithImage:(UIImage *)image scaledToFitSize:(CGSize)newSize
{
	CGFloat k = image.size.width / newSize.width;
	return [self kf_imageWithImage:image scaledToSize:CGSizeMake(newSize.width, newSize.height / k)];
}

@end
