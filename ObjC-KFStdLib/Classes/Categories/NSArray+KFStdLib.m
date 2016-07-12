//
//  NSArray+KFStdLib.m
//
//  Copyright © 2014 Igor. All rights reserved.
//

#import "NSArray+KFStdLib.h"

@implementation NSArray (KFStdLib)

- (NSArray *)kf_filter:(BOOL (^)(id item))filterBlock
{
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
	
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		if (filterBlock(obj)) {
			[array addObject:obj];
		}
	}];
	
	return [NSArray arrayWithArray:array];
}

- (NSArray *)kf_map:(id (^)(id item))mapBlock
{
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
	
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		id res = mapBlock(obj);
		NSAssert(res != nil, @"Use filter method to filter some items");
		[array addObject:res];
	}];
	
	return [NSArray arrayWithArray:array];
}

- (id)kf_findFirst:(BOOL (^)(id item))searchBlock
{
	__block id result = nil;
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		if (searchBlock(obj)) {
			result = obj;
			*stop = YES;
		}
	}];
	
	return result;
}

- (NSUInteger)kf_count:(BOOL (^)(id item))countBlock
{
	__block NSUInteger count = 0;
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		if (countBlock(obj)) {
			count++;
		}
	}];
	
	return count;
}

- (void)kf_foreach:(void (^)(id item))block
{
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		block(obj);
	}];
}

@end
