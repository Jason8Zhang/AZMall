//
//  ViewController.m
//  AZMall
//
//  Created by jason on 15/9/10.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)loginbtn:(id)sender{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSLog(@"");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
