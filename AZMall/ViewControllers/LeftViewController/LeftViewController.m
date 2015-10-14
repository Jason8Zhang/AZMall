//
//  LeftViewController.m
//  AZMall
//
//  Created by jason on 15/9/14.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "LeftViewController.h"
#import "GestureLoginViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPush:(id)sender {
    NSLog(@"btn action ");
    GestureLoginViewController *loginViewController = [[UIStoryboard storyboardWithName:@"GestureLoginVC" bundle:nil] instantiateViewControllerWithIdentifier:@"GestureLoginVC"];
    [self presentViewController:loginViewController animated:YES completion:nil];
//    [self presentViewController:[[GestureLoginViewController alloc] initWithGestureLockViewType:GestureLockViewType_Create]
//                       animated:YES
//                     completion:^{
//        
//    }];
    
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
