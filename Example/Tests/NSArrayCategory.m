//
//  NSArrayCategory.m
//  ObjC-KFStdLib
//
//  Created by Igor Zubko on 13.07.16.
//  Copyright © 2016 Igor Zubko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <NSArray+KFStdLib.h>

@interface NSArrayCategory : XCTestCase
@end

@implementation NSArrayCategory

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)test_filter_block_with_items
{
	NSMutableArray *arrSrc  = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, nil];
	NSMutableArray *arrCopy = [arrSrc copy];
	
	NSArray *arr1 = [arrSrc kf_filter: ^BOOL(NSNumber *num){
		return num.integerValue < 3;
	}];
	
	expect(arrSrc).to.equal(arrCopy);
	expect(arr1).to.equal(@[@1, @2]);
}

- (void)test_filter_block_empty
{
	NSArray *arrSrc = @[];
	NSArray *arr1 = [arrSrc kf_filter: ^BOOL(NSNumber *num){
		return NO;
	}];
	
	expect(arr1.count).to.equal(0);
}

- (void)test_map_block_with_items
{
	NSMutableArray *arrSrc  = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
	NSMutableArray *arrCopy = [arrSrc copy];

	NSArray *arr1 = [arrSrc kf_map: ^id(NSNumber *num){
		return @(num.integerValue * 2);
	}];
	
	expect(arrSrc).to.equal(arrCopy);
	expect(arr1).to.equal(@[@2, @4, @6]);
}

- (void)test_map_block_with_null
{
	NSArray *arrSrc = @[ @1, @2, @3 ];
	
	NSArray *arr1 = [arrSrc kf_map: ^id(NSNumber *num){
		return [NSNull null];
	}];
	
	expect(arr1).to.equal(@[[NSNull null], [NSNull null], [NSNull null]]);
}

- (void)test_map_block_with_nil
{
	NSArray *arrSrc = @[ @1, @2, @3 ];
	
	expect(^{
		[arrSrc kf_map: ^id(NSNumber *num){
			return nil;
		}];
	}).to.raiseAny();
}

- (void)test_find_first_block
{
	NSArray *arrSrc = @[ @1, @2, @3, @4 ];
	
	NSNumber *num1 = [arrSrc kf_findFirst:^BOOL(NSNumber *num){
		return num.integerValue % 2 == 0;
	}];
	
	NSNumber *num2 = [arrSrc kf_findFirst:^BOOL(NSNumber *num){
		return NO;
	}];
	
	expect(num1).to.equal(@2);
	expect(num2).to.beNil();
}

- (void)test_count_block
{
	NSArray *arrSrc = @[ @1, @2, @3, @4, @5, @6, @8 ];
	
	NSUInteger count1 = [arrSrc kf_count:^BOOL(NSNumber *num){
		return num.integerValue % 2 == 0;
	}];
	
	NSUInteger count2 = [arrSrc kf_count:^BOOL(NSNumber *num){
		return YES;
	}];
	
	NSUInteger count3 = [arrSrc kf_count:^BOOL(NSNumber *num){
		return NO;
	}];
	
	
	expect(count1).to.equal(4);
	expect(count2).to.equal(arrSrc.count);
	expect(count3).to.equal(0);
}

- (void)test_foreach_block
{
	NSArray *arrSrc = @[ @1, @2, @3, @4 ];
	
	__block NSInteger index = 0;
	[arrSrc kf_foreach:^(NSNumber *num) {
		expect(num).to.equal(arrSrc[index]);
		
		index++;
	}];
}

@end
