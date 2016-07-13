//
//  NSDictionaryCategory.m
//  ObjC-KFStdLib
//
//  Created by Igor Zubko on 13.07.16.
//  Copyright © 2016 Igor Zubko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <NSDictionary+KFStdLib.h>

@interface NSDictionaryCategory : XCTestCase
@property (nonatomic, retain) NSDictionary<NSNumber *, NSString *> *testDictionary;
@end

@implementation NSDictionaryCategory

- (void)setUp
{
	[super setUp];
	
	self.testDictionary = @{
		@3: @"value1",
		@4: @"value2",
		@5: @"value3",
		@6: @"value0"
	};
}

- (void)test_map_values
{
	NSDictionary<NSNumber *, NSString *> *result = [self.testDictionary kf_map:^id(NSNumber *key, NSString *item) {
		return [NSString stringWithFormat:@"%@_%@", item.uppercaseString, @(key.integerValue * 2)];
	}];
						
	expect(result[@3]).to.equal(@"VALUE1_6");
	expect(result[@4]).to.equal(@"VALUE2_8");
	expect(result[@5]).to.equal(@"VALUE3_10");
	expect(result[@6]).to.equal(@"VALUE0_12");
}

- (void)test_map_nil_values
{
	expect(^{
		[self.testDictionary kf_map:^id(NSNumber *key, NSString *item) {
			return nil;
		}];
	}).to.raiseAny();
}

- (void)test_filter_values
{
	NSDictionary *result = [self.testDictionary kf_filter:^BOOL (NSNumber *key, NSString *item) {
		return (key.integerValue % 2 == 0) || [item isEqualToString:@"value3"];
	}];
	
	expect(result.count).to.equal(3);
	expect(result[@4]).notTo.beNil();
	expect(result[@5]).notTo.beNil();
	expect(result[@6]).notTo.beNil();
}

- (void)test_filter_empty_dictionary
{
	NSDictionary *src = @{};
	NSDictionary *result = [src kf_filter:^BOOL (NSNumber *key, NSString *item) {
		return YES;
	}];
	
	expect(result).to.equal(src);
}

- (void)test_remove_keys
{
	NSDictionary *result = [self.testDictionary kf_removeKeys:@[@3, @6]];
	expect(result.count).to.equal(2);
	expect(result[@3]).to.beNil();
	expect(result[@4]).notTo.beNil();
	expect(result[@5]).notTo.beNil();
	expect(result[@6]).to.beNil();
}

- (void)test_remove_empty_keys
{
	NSDictionary *result = [self.testDictionary kf_removeKeys:@[]];
	expect(result).to.equal(self.testDictionary);
}

- (void)test_remove_keys_from_empty
{
	NSDictionary *result = [@{} kf_removeKeys:@[@3, @6]];
	expect(result).to.beEmpty();
}

- (void)test_flatten_with_null_values
{
	NSDictionary *result = [[self.testDictionary kf_map:^id(NSNumber *key, NSString *item) {
		return (key.integerValue % 2 == 0) ? [NSNull null] : item;
	}] kf_flatten];
	
	expect(result.count).to.equal(2);
	expect(result[@3]).notTo.beNil();
	expect(result[@4]).to.beNil();
	expect(result[@5]).notTo.beNil();
	expect(result[@6]).to.beNil();
}

- (void)test_flatten_with_null_keys_and_values
{
	NSDictionary *dictionary = @{
		[NSNull null]: @"empty 1",
		[NSNull null]: @"empty 2",
		@4: @"value2",
		@5: [NSNull null],
		@6: @"value0"
	};
	
	NSDictionary *result = [dictionary kf_flatten];
	
	expect(result.count).to.equal(2);
	expect(result[@4]).notTo.beNil();
	expect(result[@6]).notTo.beNil();
}


@end
//
//- (NSDictionary<KeyType, ObjectType> *)kf_flatten;
//@end
