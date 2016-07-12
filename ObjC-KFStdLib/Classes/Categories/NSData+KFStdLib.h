//
//  NSData+StdLib.h
//
//  Copyright © 2015 Igor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (KFStdLib)

+ (NSData *)kf_dataWithContentsOfStream:(NSInputStream *)input error:(NSError **)error;
+ (NSData *)kf_dataWithContentsOfStream:(NSInputStream *)input initialCapacity:(NSUInteger)capacity error:(NSError **)error;

- (NSString *)kf_toString;

- (NSString *)kf_toHexSting;

@end