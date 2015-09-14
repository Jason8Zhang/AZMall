//
//  FPSingle.m
//  TimeFly
//
//  Created by jason on 15/7/2.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "FPSingle.h"

@implementation FPSingle
@synthesize naviVC;
@synthesize mainVC;
static FPSingle *_sharedInstance = nil;

- (instancetype)init{
    self = [super init];
    if(self){
//        self.tokenIndex = 1;
//        _isKHByLogin = NO;
        self.mainVC = [MainSuperViewController new];
        self.naviVC = [UINavigationController new];
    }
    return  self;
}

+ (FPSingle *)sharedInstance{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}
@end
