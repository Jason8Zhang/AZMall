//
//  FPSingle.h
//  TimeFly
//
//  Created by jason on 15/7/2.
//  Copyright © 2015年 jason. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MainSuperViewController.h"
@interface FPSingle : NSObject
{
    BOOL _isLogin;  //是否登陆标志
    
}
@property (nonatomic,assign)BOOL isLogin;
@property (nonatomic,strong) MainSuperViewController *mainVC;
@property (nonatomic,strong) UINavigationController *naviVC;
+ (FPSingle *)sharedInstance;
@end
