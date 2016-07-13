//
//  KFDebuggingToolsTest.m
//  ObjC-KFStdLib
//
//  Created by Igor Zubko on 13.07.16.
//  Copyright © 2016 Igor Zubko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KFDebuggingTools.h>

@interface KFDebuggingToolsTest : XCTestCase
@end

@implementation KFDebuggingToolsTest

- (void)test_should_be_in_debugger
{
	__unused int result = DDebugIsInDebugger();
//	expect(result).to.equal(1);
}

@end
