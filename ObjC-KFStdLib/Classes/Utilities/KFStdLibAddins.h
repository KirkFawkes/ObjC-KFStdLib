//
//  KFStdLibAddins.h
//
//  Copyright © 2014 Igor. All rights reserved.
//

#ifndef KFStdLibAddins_h
#define KFStdLibAddins_h

#import <AvailabilityMacros.h>
#import <CoreLocation/CLLocation.h>
#import <UIKit/UIColor.h>

static inline int RND(int min, int max) {
	return (arc4random()%(max - min)) + min;
}

#pragma mark - Colors

static inline UIColor * RGBACOLOR(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
	return [UIColor colorWithRed:(red/255.f) green:(green/255.f) blue:(blue/255.f) alpha:alpha];
}

static inline UIColor * RGBCOLOR(CGFloat red, CGFloat green, CGFloat blue) {
	return RGBACOLOR(red, green, blue, 1.f);
}

static inline UIColor * RGBCOLORHEX(NSUInteger rgbValue) {
	CGFloat red =   (rgbValue & 0xFF0000) >> 16;
	CGFloat green = (rgbValue & 0x00FF00) >> 8;
	CGFloat blue =  (rgbValue & 0x0000FF);
	
	return RGBCOLOR(red, green, blue);
}

static inline UIColor * RNDCOLOR() {
	return RGBCOLOR(RND(0, 255), RND(0, 255), RND(0, 255));
}

#pragma mark - Others

inline static NSString *NSStringFromCLLocationCoordinate2D(const CLLocationCoordinate2D location) {
	return [NSString stringWithFormat:@"%lf,%lf", location.latitude, location.longitude];
}

inline static void KFDispatchAfter(CGFloat time, dispatch_block_t block) {
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time* NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

inline static NSError *KFErrorMake(NSString *domain, NSInteger code, NSString *localizedDescription) {
	NSDictionary *userInfo = (localizedDescription.length > 0) ? @{NSLocalizedDescriptionKey: localizedDescription} : nil;
	return [NSError errorWithDomain:domain code:code userInfo:userInfo];
}

#define KFSafeCallBlock(block, ...) do { if (block) block(__VA_ARGS__); } while(0)

#endif /* KFStdLibAddins_h */
