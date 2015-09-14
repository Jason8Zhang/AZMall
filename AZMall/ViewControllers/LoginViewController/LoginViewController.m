//
//  LoginViewController.m
//  AZMall
//
//  Created by jason on 15/9/13.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "LoginViewController.h"

#define BOUNDS    [UIScreen mainScreen].bounds
#define offsetLeftHand      60

#define rectLeftHand        CGRectMake(61-offsetLeftHand, 90, 40, 65)
#define rectLeftHandGone    CGRectMake(BOUNDS.size.width / 2 - 100, vLogin.frame.origin.y - 22, 40, 40)

#define rectRightHand       CGRectMake(imgLoginView.frame.size.width / 2 + 60, 90, 40, 65)
#define rectRightHandGone   CGRectMake(BOUNDS.size.width / 2 + 62, vLogin.frame.origin.y - 22, 40, 40)

@interface LoginViewController (){
    UITextField *txtUserName;
    UITextField *txtUserPassword;
    
    UIImageView *imgLeftHand;
    UIImageView *imgRightHand;
    
    UIImageView *imgLeftHandGone;
    UIImageView *imgRightHandGone;
    
    AZLoginShowType showType;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
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

-(void) initUI{
    UIImageView *imgLoginView = [[UIImageView alloc] initWithFrame:CGRectMake(BOUNDS.size.width / 2 - 211/2, 100, 211, 109)];
    imgLoginView.image = [UIImage imageNamed:@"owl-login"];
    imgLoginView.layer.masksToBounds = YES;
    [self.view addSubview:imgLoginView];
    
    imgLeftHand = [[UIImageView alloc] initWithFrame:rectLeftHand];
    imgLeftHand.image = [UIImage imageNamed:@"owl-login-arm-left"];
    [imgLoginView addSubview:imgLeftHand];
    
    imgRightHand = [[UIImageView alloc] initWithFrame:rectRightHand];
    imgRightHand.image = [UIImage imageNamed:@"owl-login-arm-right"];
    [imgLoginView addSubview:imgRightHand];
    
    UIView* vLogin = [[UIView alloc] initWithFrame:CGRectMake(15, 200, BOUNDS.size.width - 30, 160)];
    vLogin.layer.borderWidth = 0.5;
    vLogin.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    vLogin.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vLogin];
    
    imgLeftHandGone = [[UIImageView alloc] initWithFrame:rectLeftHandGone];
    imgLeftHandGone.image = [UIImage imageNamed:@"icon_hand"];
    [self.view addSubview:imgLeftHandGone];
    
    imgRightHandGone = [[UIImageView alloc] initWithFrame:rectRightHandGone];
    imgRightHandGone.image = [UIImage imageNamed:@"icon_hand"];
    [self.view addSubview:imgRightHandGone];
    
    txtUserName = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, vLogin.frame.size.width - 60, 44)];
    txtUserName.delegate = self;
    txtUserName.layer.cornerRadius = 5;
    txtUserName.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    txtUserName.layer.borderWidth = 0.5;
    txtUserName.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    txtUserName.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgUser.image = [UIImage imageNamed:@"iconfont-user"];
    [txtUserName.leftView addSubview:imgUser];
    [vLogin addSubview:txtUserName];
    
    txtUserPassword = [[UITextField alloc] initWithFrame:CGRectMake(30, 90, vLogin.frame.size.width - 60, 44)];
    txtUserPassword.delegate = self;
    txtUserPassword.layer.cornerRadius = 5;
    txtUserPassword.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    txtUserPassword.layer.borderWidth = 0.5;
    txtUserPassword.secureTextEntry = YES;
    txtUserPassword.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    txtUserPassword.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgPwd = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgPwd.image = [UIImage imageNamed:@"iconfont-password"];
    [txtUserPassword.leftView addSubview:imgPwd];
    [vLogin addSubview:txtUserPassword];

}

#pragma mark - UITextfield delegate 
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([textField isEqual:txtUserName]) {
        if (showType != AZLoginShowTypeUserName)
        {
            showType = AZLoginShowTypeUserName;
            return;
        }
        showType = AZLoginShowTypeUserName;
        [UIView animateWithDuration:0.5 animations:^{
            imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x - offsetLeftHand, imgLeftHand.frame.origin.y + 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
            
            imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x + 48, imgRightHand.frame.origin.y + 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
            
            
            imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x - 70, imgLeftHandGone.frame.origin.y, 40, 40);
            
            imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x + 30, imgRightHandGone.frame.origin.y, 40, 40);
            
            
        } completion:^(BOOL b) {
        }];
        
    }
    else if ([textField isEqual:txtUserPassword]) {
        if (showType == AZLoginShowTypePassword)
        {
            showType = AZLoginShowTypePassword;
            return;
        }
        showType = AZLoginShowTypePassword;
        [UIView animateWithDuration:0.5 animations:^{
            imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x + offsetLeftHand, imgLeftHand.frame.origin.y - 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
            imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x - 48, imgRightHand.frame.origin.y - 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
            
            
            imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x + 70, imgLeftHandGone.frame.origin.y, 0, 0);
            
            imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x - 30, imgRightHandGone.frame.origin.y, 0, 0);
            
        } completion:^(BOOL b) {
        }];
    }
//    if ([textField isEqual:txtUserName]) {
//        if (showType != AZLoginShowTypeUserName) {
//            showType = AZLoginShowTypeUserName;
//            return;
//        }
//    
//
//    showType = AZLoginShowTypeUserName;
//    [UIView animateWithDuration:0.5 animations:^{
//        imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x - offsetLeftHand, imgLeftHand.frame.origin.y + 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
//        
//        imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x + 48, imgRightHand.frame.origin.y + 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
//        
//        
//        imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x - 70, imgLeftHandGone.frame.origin.y, 40, 40);
//        
//        imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x + 30, imgRightHandGone.frame.origin.y, 40, 40);
//        
//        
//    }completion:^(BOOL finished) {
//        NSLog(@"睁眼");
//        
//    }];
//    }
//    else if ([textField isEqual:txtUserPassword]){
//        if (showType == AZLoginShowTypePassword) {
//            showType = AZLoginShowTypePassword;
//            return;
//        }
//        showType = AZLoginShowTypePassword;
//        [UIView animateWithDuration:0.5 animations:^{
//            imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x + offsetLeftHand, imgLeftHand.frame.origin.y - 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
//            imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x - 48, imgRightHand.frame.origin.y - 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
//            imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x + 70, imgLeftHandGone.frame.origin.y, 0, 0);
//    
//            imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x - 30, imgRightHandGone.frame.origin.y, 0, 0);
//        } completion:^(BOOL finished) {
//            NSLog(@"闭眼");
//        }];
//    }
}

@end
