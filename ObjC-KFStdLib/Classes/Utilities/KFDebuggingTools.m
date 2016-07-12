//
//  KFDebuggingTools.m
//
//  Copyright © 2014 Igor. All rights reserved.
//

#import "KFDebuggingTools.h"
#import <sys/sysctl.h>

int DDebugIsInDebugger(void)
{
	int                 mib[4];
	struct kinfo_proc   info;
	size_t              size;
	
	// Initialize the flags so that, if sysctl fails for some bizarre
	// reason, we get a predictable result.
	
	info.kp_proc.p_flag = 0;
	
	// Initialize mib, which tells sysctl the info we want, in this case
	// we're looking for information about a specific process ID.
	
	mib[0] = CTL_KERN;
	mib[1] = KERN_PROC;
	mib[2] = KERN_PROC_PID;
	mib[3] = getpid();
	
	// Call sysctl.
	
	size = sizeof(info);
	sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
	
	// We're being debugged if the P_TRACED flag is set.
	
	return (info.kp_proc.p_flag & P_TRACED) != 0;
}

void DDebugLog(NSString *format, ...)
{
	va_list args;
	va_start(args, format);
	NSString *logString = [[NSString alloc] initWithFormat:format arguments:args];
	va_end(args);
	
	NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
	[timeFormat setDateFormat:@"HH:mm:ss.SSS"];
	NSString *timeString = [timeFormat stringFromDate:[NSDate date]];
	
	printf("[%s] %s\n", timeString.UTF8String, [logString UTF8String]);
}
