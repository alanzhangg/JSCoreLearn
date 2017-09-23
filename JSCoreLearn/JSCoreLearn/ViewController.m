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

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) JSContext * context;

@end

@implementation ViewController

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSLog(@"webview = %@", [self.context class]);
    [self testMakeUIColor];
}


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL * url = [NSURL URLWithString:@"https://www.jianshu.com"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
	JSContext * context = [[JSContext alloc] init];
	JSValue * result = [context evaluateScript:@"2+2"];
	NSLog(@"2 + 2 = %d", [result toInt32]);
//    [self factorial];
    [self testDelegate];
}

//js -> oc delegate
- (void)testDelegate{
	NSString * path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"js"];
	NSString * testScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	JSContext * context = [[JSContext alloc] init];
	
	
	MyPoint * point1 = [[MyPoint alloc] initWithX:1 y:2];
	MyPoint * point2 = [[MyPoint alloc] initWithX:3 y:4];
    context[@"point1"] = point1;
    context[@"point2"] = point2;
//     = [context evaluateScript:@"euclideanDistance(point, point3)"];
    JSValue *value = [context evaluateScript:testScript];
    NSLog(@"protocol = %f", [value toDouble]);
}

// js -> oc block
- (void)testMakeUIColor{
//    JSContext * context = [[JSContext alloc] init];
	_context[@"orderBy"] = ^(NSDictionary * rgbColor){
		NSLog(@"color = %@", [UIColor colorWithRed:([rgbColor[@"red"] floatValue] / 255.0)
							   green:([rgbColor[@"green"] floatValue] / 255.0)
								blue:([rgbColor[@"blue"] floatValue] / 255.0)
							   alpha:1]);
	};
//    JSValue * color = [_context evaluateScript:@"orderBy({red: 150, green: 150, blue: 200})"];
//    NSLog(@"%@", [[color toObject] class]);
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
