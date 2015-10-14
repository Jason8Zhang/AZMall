//
//  HomeViewController.m
//  AZMall
//
//  Created by jason on 15/9/14.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "HomeViewController.h"
#import "FPSingle.h"
#import "AZNetWorking.h"
#import "MBProgressHUD.h"

@interface HomeViewController ()
{
     MBProgressHUD *HUD;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender{
    AZNetWorking *network = [AZNetWorking new];
    NSString *strHostName = @"route.showapi.com";
    NSString *strHostPath = @"95-106";
    NSMutableDictionary *dicPara = [NSMutableDictionary new];
    [dicPara setObject:@"5958" forKey:@"showapi_appid"];
    [dicPara setObject:@"7653c8a1b4a344cd8332361bd74f2b36" forKey:@"showapi_sign"];
    [dicPara setObject:@"奶酪" forKey:@"name"];
     [network postHttpTransactionWithHostName:strHostName
                                     hostPath:strHostPath
                                       useSSL:YES
                                     withPara:dicPara
                                  sucessBlock:^(id response) {
                                      NSLog(@"SUCESS ");
                                      NSLog(@"RESPONSE %@",response);
                                      
                                  } failBlock:^(NSError *error) {
                                      NSLog(@"error :%@",error);
                                  }];
//    [network.activityIndicator addHUDToView:self.view];
//    MBProgressHUD *hud = [MBProgressHUD new];
    AZActivityIndicator *indicator = [AZActivityIndicator new];
    [indicator addHUDToView:self.view];
}
- (IBAction)btn2:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.color = [UIColor clearColor];
    HUD.opacity = 0.5;
    HUD.margin = 20.0f;
    HUD.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5f];
    HUD.labelText = @"操作成功";
    HUD.mode = MBProgressHUDModeCustomView;
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    NSArray *arrays = [[NSArray alloc]initWithObjects:
                       [UIImage imageNamed:@"leopardRun_01"],
                       [UIImage imageNamed:@"leopardRun_02"],
                       [UIImage imageNamed:@"leopardRun_03"],
                       [UIImage imageNamed:@"leopardRun_04"],
                       [UIImage imageNamed:@"leopardRun_05"],
                       [UIImage imageNamed:@"leopardRun_06"],
                       [UIImage imageNamed:@"leopardRun_07"],
                       [UIImage imageNamed:@"leopardRun_08"],
                       [UIImage imageNamed:@"leopardRun_09"],
                       [UIImage imageNamed:@"leopardRun_10"], nil];
    backView.animationImages = arrays;
    backView.animationDuration = 1;
    
    [backView startAnimating];
    HUD.customView = backView;
    [self.view addSubview:HUD];
    [HUD show:YES];

}
@end
