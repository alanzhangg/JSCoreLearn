//
//  ViewController.m
//  JSCoreLearn
//
//  Created by jinxin on 22/09/2017.
//  Copyright © 2017 jinxin. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "MyPoint.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	JSContext * context = [[JSContext alloc] init];
	JSValue * result = [context evaluateScript:@"2+2"];
	NSLog(@"2 + 2 = %d", [result toInt32]);
	[self factorial];
	[self testMakeUIColor];
}

//js -> oc delegate
- (void)testDelegate{
	NSString * path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"js"];
	NSString * testScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	JSContext * context = [[JSContext alloc] init];
	[context evaluateScript:testScript];
	
	MyPoint * point1 = [[MyPoint alloc] initWithX:1 y:2];
	MyPoint * point2 = [[MyPoint alloc] initWithX:3 y:4];
	JSValue * function = context[@""];
}

// js -> oc block
- (void)testMakeUIColor{
	JSContext * context = [[JSContext alloc] init];
	context[@"createUIColor"] = ^(NSDictionary * rgbColor){
		return [UIColor colorWithRed:([rgbColor[@"red"] floatValue] / 255.0)
							   green:([rgbColor[@"green"] floatValue] / 255.0)
								blue:([rgbColor[@"blue"] floatValue] / 255.0)
							   alpha:1];
	};
	JSValue * color = [context evaluateScript:@"createUIColor({red: 150, green: 150, blue: 200})"];
	NSLog(@"%@", [[color toObject] class]);
}

// oc -> js
- (void)factorial{
	NSString * path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"js"];
	NSString * testScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	JSContext * context = [[JSContext alloc] init];
	[context evaluateScript:testScript];
	
	JSValue * function = context[@"factorial"];
	JSValue * result = [function callWithArguments:@[@10]];
	NSLog(@"factorial(10) = %d", [result toInt32]);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
