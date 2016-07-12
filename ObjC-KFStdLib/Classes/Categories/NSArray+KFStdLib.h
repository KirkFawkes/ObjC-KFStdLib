//
//  NSArray+KFStdLib.h
//
//  Copyright © 2014 Igor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<__covariant ObjectType> (KFStdLib)

- (NSArray<ObjectType> *)kf_filter:(BOOL (^)(ObjectType item))filterBlock;

- (NSArray *)kf_map:(id (^)(ObjectType item))mapBlock;

- (ObjectType)kf_findFirst:(BOOL (^)(ObjectType item))searchBlock;

- (NSUInteger)kf_count:(BOOL (^)(ObjectType item))countBlock;

- (void)kf_foreach:(void (^)(ObjectType item))block;

@end
