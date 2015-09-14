//
//  LoginViewController.h
//  AZMall
//
//  Created by jason on 15/9/13.
//  Copyright © 2015年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperViewController.h"
typedef  NS_ENUM(NSInteger,AZLoginShowType){
    AZLoginShowTypeNone,
    AZLoginShowTypePassword,
    AZLoginShowTypeUserName
};

@interface LoginViewController : SuperViewController

@end
