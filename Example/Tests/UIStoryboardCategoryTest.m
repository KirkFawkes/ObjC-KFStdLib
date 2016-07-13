//
//  UIStoryboardCategoryTest.m
//  ObjC-KFStdLib
//
//  Created by Igor Zubko on 13.07.16.
//  Copyright © 2016 Igor Zubko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIStoryboard+KFStdLib.h>

@interface UIStoryboardCategoryTest : XCTestCase
@end

@implementation UIStoryboardCategoryTest

- (void)test_should_load_viewcontroller
{
	UIViewController *vc = [UIStoryboard kf_viewControllerWithIdentifier:@"TestingViewController"
													  fromStoryboardName:@"TestingStoryboard"];
	expect(vc).to.beKindOf([UIViewController class]);
}

- (void)test_shoudnt_load_viewcontroller
{
	expect(^{
		[UIStoryboard kf_viewControllerWithIdentifier:@"saasvdsvrwrascdas"
								   fromStoryboardName:@"TestingStoryboard"];
	}).to.raiseAny();
}

- (void)test_shoudnt_load_storyboard
{
	expect(^{
		[UIStoryboard kf_viewControllerWithIdentifier:@"saasvdsvrwrascdas"
								   fromStoryboardName:@"adasscas"];
	}).to.raiseAny();
}

@end
