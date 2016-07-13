//
//  UIImageCategory.m
//  ObjC-KFStdLib
//
//  Created by Igor Zubko on 13.07.16.
//  Copyright © 2016 Igor Zubko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIImage+KFStdLib.h>

#define kImageWidth  200
#define kImageHeight 100

@interface UIImageCategory : XCTestCase
@property (nonatomic, strong, readonly) UIColor *imageColor;
@property (nonatomic, strong, readonly) UIImage *initialImage;
@end

@implementation UIImageCategory

- (void)setUp
{
    [super setUp];
	
	self->_imageColor = [UIColor greenColor];
	self->_initialImage = [UIImage kf_imageWithSize:CGSizeMake(kImageWidth, kImageHeight) andColor:self.imageColor];
}

- (void)test_image_scaled_to_size
{
	UIImage *src = self.initialImage;
	
	const CGSize dstSize = CGSizeMake(30, 40);

	UIImage *result = [UIImage kf_imageWithImage:src scaledToSize:dstSize];
	expect(result.size).to.equal(dstSize);
}

- (void)test_image_scaled_to_fit_size
{
	UIImage *src = self.initialImage;
	
	const CGSize dstSize = CGSizeMake(30, 40);
	
	UIImage *result = [UIImage kf_imageWithImage:src scaledToFitSize:dstSize];
	expect(result.size.width).to.equal(dstSize.width);
	expect(result.size.height).to.equal(15.f);
}

@end
