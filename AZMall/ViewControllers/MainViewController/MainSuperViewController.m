//
//  MainSuperViewController.m
//  AZMall
//
//  Created by jason on 15/9/14.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "MainSuperViewController.h"


@interface MainSuperViewController ()

@end

@implementation MainSuperViewController
@synthesize homeVC = _homeVC;
@synthesize leftVC = _leftVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.homeVC = [[UIStoryboard storyboardWithName:@"HomeVC" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeVC"];
    self.leftVC = [[UIStoryboard storyboardWithName:@"LeftVC" bundle:nil] instantiateViewControllerWithIdentifier:@"LeftVC"];
    self.centerController = _leftVC;
    self.leftController = _homeVC;
    
//    self.centerController = [[UIStoryboard storyboardWithName:@"HomeVC" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeVC"];
//    self.leftController = [[UIStoryboard storyboardWithName:@"LeftVC" bundle:nil] instantiateViewControllerWithIdentifier:@"LeftVC"];
    self.elastic = YES;
    self.leftSize = [UIScreen mainScreen].bounds.size.width - 255;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
