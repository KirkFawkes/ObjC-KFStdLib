//
//  UIImage+KFStdLib.h
//
//  Copyright © 2015 Igor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KFStdLib)

+ (UIImage *)kf_imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (UIImage *)kf_imageWithImage:(UIImage *)image scaledToFitSize:(CGSize)newSize;

@end
