//
//  UIVIewCategoryTest.m
//  ObjC-KFStdLib
//
//  Created by Igor Zubko on 13.07.16.
//  Copyright © 2016 Igor Zubko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIView+KFStdLib.h>

@interface TestingView : UIView
@end

@implementation TestingView
@end

#pragma mark - Tests

@interface UIVIewCategoryTest : XCTestCase
@end

@implementation UIVIewCategoryTest

- (void)test_shoud_load_view_from_nib
{
	UIView *view = [TestingView kf_loadViewFromNib];
	expect(view).to.beKindOf([TestingView class]);
}

- (void)test_shoudnt_load_view
{
	expect(^{
		[UIView kf_loadViewFromNib];
	}).to.raise(@"NSInternalInconsistencyException");
	
}

@end
