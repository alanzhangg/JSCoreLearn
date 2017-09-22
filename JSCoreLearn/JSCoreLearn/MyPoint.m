//
//  MyPoint.m
//  JSCoreLearn
//
//  Created by jinxin on 22/09/2017.
//  Copyright © 2017 jinxin. All rights reserved.
//

#import "MyPoint.h"

@interface MyPoint () <MyPointDelegate>

@end

@implementation MyPoint

@synthesize x = _x;
@synthesize y = _y;

- (instancetype)initWithX:(double)x y:(double)y{
	if (self = [super init]) {
		_x = x;
		_y = y;
	}
	return self;
}

- (void)myPrivateMethod{
	NSLog(@"%s", __FUNCTION__);
}

- (NSString *)description{
	NSLog(@"%s", __FUNCTION__);
	return @"nihao";
}

+ (MyPoint *)makePointWithX:(double)x y:(double)y{
	NSLog(@"%s", __FUNCTION__);
	return [[MyPoint alloc] init];
}

- (void)setX:(double)x{
	_x = x;
}

- (void)setY:(double)y{
	_y = y;
}

@end
