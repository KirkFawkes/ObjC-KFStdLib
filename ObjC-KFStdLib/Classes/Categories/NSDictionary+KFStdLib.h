//
//  NSDictionary+KFStdLib.h
//
//  Copyright © 2014 Igor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (KFStdLib)
- (NSDictionary<KeyType, ObjectType> *)kf_map:(id (^)(KeyType key, ObjectType item))mapBlock;
- (NSDictionary<KeyType, ObjectType> *)kf_filter:(BOOL (^)(KeyType key, ObjectType item))filterBlock;

- (NSDictionary<KeyType, ObjectType> *)kf_removeKeys:(NSArray<KeyType> *)keysToRemove;

- (NSDictionary<KeyType, ObjectType> *)kf_flatten;
@end
