//
//  KFDebuggingTools.h
//
//  Copyright © 2014 Igor. All rights reserved.
//

#import <Foundation/Foundation.h>

#if defined(DEBUG)
	#define DLOG(xx, ...) DDebugLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
	#define DLOG(xx, ...)  ((void)0)
#endif // #if defined(DEBUG)

#define DLOGMETHODNAME() DLOG(@"")

int DDebugIsInDebugger(void);
void DDebugLog(NSString *format, ...);

#if defined(DEBUG)
	#define DASSERT(xx) { if (!(xx)) { \
		DLOG(@"DASSERT failed: %s", #xx); \
		if (DDebugIsInDebugger()) { NSAssert(xx, @"Assert failed"); /* __asm__("int $3\n" : : );*/ } \
	} } ((void)0)

	#define DASSERTWARNING(xx) do { if (!(xx)) DLOG(@"**WARNING** Assert failed: %s", #xx); } while(0)
#else
	#define DASSERT(xx) ((void)0)
	#define DASSERTWARNING(xx) ((void)0)
#endif // #if defined(DEBUG)

#if defined(DEBUG)
	extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));
#else
	#define dispatch_benchmark(xx, yy) ((void)0)
#endif