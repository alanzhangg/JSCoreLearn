//
//  MyPoint.h
//  JSCoreLearn
//
//  Created by jinxin on 22/09/2017.
//  Copyright © 2017 jinxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol MyPointDelegate;

@interface MyPoint : NSObject

- (void)myPrivateMethod;
- (instancetype)initWithX:(double)x y:(double)y;

@end

@protocol MyPointDelegate <JSExport>

@property (nonatomic) double x;
@property (nonatomic) double y;

- (NSString *)description;
+ (MyPoint *)makePointWithX:(double)x y:(double)y;

@end


