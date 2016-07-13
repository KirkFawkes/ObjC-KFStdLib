//
//  UIImage+KFStdLib.m
//
//  Copyright © 2016 Igor. All rights reserved.
//

#import "UIImage+KFStdLib.h"

@implementation UIImage (KFStdLib)

#pragma mark - Image creating methods

+ (UIImage *)kf_imageWithSize:(CGSize)size andColor:(UIColor *)color
{
	CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
	
	UIGraphicsBeginImageContext(rect.size);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetFillColorWithColor(context, color.CGColor);
	CGContextFillRect(context, rect);
	
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return image;
}

#pragma mark - Resize methods

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
	CGFloat k = image.size.width / image.size.height;
	CGFloat newW = newSize.width;
	CGFloat newH = newW / k;
	
	if (newH > newSize.height)
	{
		newH = newSize.height;
		newW = newH * k;
	}
	
	return [self kf_imageWithImage:image scaledToSize:CGSizeMake(newW, newH)];
}

@end
