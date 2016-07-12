//
//  NSData+StdLib.m
//
//  Copyright © 2015 Igor. All rights reserved.
//

#import "NSData+KFStdLib.h"

#define BUFSIZE 65536U

@implementation NSData (KFStdLib)

+ (NSData *)kf_dataWithContentsOfStream:(NSInputStream *)input error:(NSError **)error
{
	return [self kf_dataWithContentsOfStream:input initialCapacity:BUFSIZE error:error];
}

+ (NSData *)kf_dataWithContentsOfStream:(NSInputStream *)input initialCapacity:(NSUInteger)capacity error:(NSError **)error
{
	size_t bufsize = MIN(BUFSIZE, capacity);
	uint8_t *buf = malloc(bufsize);
	
	if (buf == NULL)
	{
		if (error) {
			*error = [NSError errorWithDomain:NSPOSIXErrorDomain code:ENOMEM userInfo:nil];
		}
		return nil;
	}
	
	NSMutableData *result = capacity == NSUIntegerMax ? [NSMutableData data] : [NSMutableData dataWithCapacity:capacity];
	@try {
		while (true)
		{
			NSInteger n = [input read:buf maxLength:bufsize];
			if (n < 0)
			{
				result = nil;
				if (error) {
					*error = [NSError errorWithDomain:NSPOSIXErrorDomain code:errno userInfo:nil];
				}
				break;
			} else if (n == 0) {
				break;
			} else {
				[result appendBytes:buf length:n];
			}
		}
	} @catch (NSException * exn) {
		result = nil;
		if (error) {
			*error = [NSError errorWithDomain:NSPOSIXErrorDomain code:EIO userInfo:nil];
		}
	}
	
	free(buf);
	
	return result;
}

- (NSString *)kf_toString
{
	return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString *)kf_toHexSting
{
	const char *data = self.bytes;
	NSMutableString *hexString = [NSMutableString string];
	
	for (int i = 0; i < self.length; i++) {
		[hexString appendFormat:@"%02.2hhX", data[i]];
	}
	
	return [NSString stringWithString:hexString];
}

@end
