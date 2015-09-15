//
//  MainSuperViewController.h
//  AZMall
//
//  Created by jason on 15/9/14.
//  Copyright © 2015年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "HomeViewController.h"
#import "LeftViewController.h"


@interface MainSuperViewController : IIViewDeckController
@property(nonatomic,retain) HomeViewController *homeVC;
@property(nonatomic,retain) LeftViewController *leftVC;
@end
