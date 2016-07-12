//
//  NSDataCategory.m
//  ObjC-KFStdLib
//
//  Created by Igor Zubko on 13.07.16.
//  Copyright © 2016 Igor Zubko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <NSData+KFStdLib.h>

@interface NSDataCategory : XCTestCase
@end

@implementation NSDataCategory

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)test_to_string
{
	NSString *str = @"Hello, world!";
	NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
	NSString *result = [strData kf_toString];
	
	expect(result).to.equal(str);
}

- (void)test_to_hex_string
{
	NSString *str = @"abcdx";
	NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
	NSString *result = [strData kf_toHexSting];
	
	expect(result).to.equal(@"6162636478");
}

- (void)test_stream_to_data
{
	NSString *str = @"Hello, world!";
	NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
	
	NSInputStream *inputStream = [[NSInputStream alloc] initWithData:strData];
	[inputStream open];
	
	NSError *error = nil;
	NSData *result = [NSData kf_dataWithContentsOfStream:inputStream error:&error];
	
	expect(error).to.beNil();
	expect(result).notTo.beNil();
	expect([result kf_toString]).to.equal(str);
}

@end

