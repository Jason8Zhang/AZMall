//
//  GestureLoginViewController.m
//  AZMall
//
//  Created by jason on 15/9/28.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "GestureLoginViewController.h"


@interface GestureLoginViewController ()

@end

@implementation GestureLoginViewController

- (instancetype) initWithGestureLockViewType:(GestureLockViewType)lockViewType
{
    if (self == [super init]) {
//        self.gestureLockView = [GestureLockView new];
//        self.gestureLockViewType = lockViewType;
//        self.gestureLockView.delegate = self;
    }
    return self;
}

- (id)init{
    if (self == [super init]) {
//        self.gestureLockView = [GestureLockView new];
//        self.gestureLockViewType = GestureLockViewType_Create;
//        self.gestureLockView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadLockView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadLockView{
//    self.gestureLockView = [GestureLockView new];
    self.gestureLockView = [[GestureLockView alloc] init];
    self.gestureLockViewType = GestureLockViewType_Create;
    self.gestureLockView.delegate = self;
    self.gestureLockView.frame = self.view.frame;
//    self.gestureLockView.frame = CGRectMake(100, 100, self.view.frame.size.width - 20, self.view.frame.size.height );
    [self.view addSubview:self.gestureLockView];
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
