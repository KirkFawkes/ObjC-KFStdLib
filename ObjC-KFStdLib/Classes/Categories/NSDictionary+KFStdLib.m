//
//  NSDictionary+KFStdLib.m
//
//  Copyright © 2014 Igor. All rights reserved.
//

#import "NSDictionary+KFStdLib.h"

@implementation NSDictionary (CPUtils)

- (NSDictionary *)kf_map:(id (^)(id key, id item))mapBlock
{
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:self.count];
	
	[self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		id result = mapBlock(key, obj);
		NSAssert(result != nil, @"Use filter method to filter some items");
		
		[dictionary setObject:result forKey:key];
	}];
	
	return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (NSDictionary *)kf_filter:(BOOL (^)(id key, id item))filterBlock
{
	if (self.count == 0) {
		return @{};
	}
	
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:self.count];
	[self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		if (filterBlock(key, obj)) {
			[dictionary setObject:obj forKey:key];
		}
	}];
	
	return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (NSDictionary *)kf_removeKeys:(NSArray *)keysToRemove
{
	if (keysToRemove.count == 0 || self.count==0) {
		return [NSDictionary dictionaryWithDictionary:self];
	}
	
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:self];
	[keysToRemove enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[dictionary removeObjectForKey:obj];
	}];
	
	return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (NSDictionary *)kf_flatten
{
	return [self kf_filter:^BOOL(id key, id item) {
		return item != [NSNull null] &&
				!([item isKindOfClass:[NSString class]] && [(NSString *)item length] == 0);
	}];
}

@end
