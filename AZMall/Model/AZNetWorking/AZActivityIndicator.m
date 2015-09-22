//
//  AZActivityIndicator.m
//  tryAFNetworking
//
//  Created by jason on 15/9/16.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "AZActivityIndicator.h"

@implementation AZActivityIndicator
@synthesize progressActivityHUD;
@synthesize activityIndicatorCount;

-(id)init{
    if (self == [super init]) {
        self.activityIndicatorCount = 0;
    }
    return self;
}
- (void)addHUDToView:(UIView*)showView{
    self.progressActivityHUD = [[MBProgressHUD alloc] initWithView:showView];
    self.progressActivityHUD.color = [UIColor clearColor];
    //设置不透明度
    self.progressActivityHUD.opacity = 0.5f;
    //设置留白
    self.progressActivityHUD.margin = 20.0f;
    self.progressActivityHUD.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    UIImageView *backview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
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
    backview.animationImages = arrays;
    backview.animationDuration = 1;
    [backview startAnimating];
    self.progressActivityHUD.customView = backview;
    self.progressActivityHUD.mode = MBProgressHUDModeCustomView;
    self.progressActivityHUD.delegate = (id<MBProgressHUDDelegate>)self;
    [showView addSubview:self.progressActivityHUD];
}
- (void)show{
    self.activityIndicatorCount++;
    [self.progressActivityHUD show:YES];
    
}
- (void)showWithLabelText:(NSString*)labelText{
    if (![labelText isEqualToString:@ ""] && labelText != nil) {
        self.progressActivityHUD.labelText = labelText;
    }
    else{
        self.progressActivityHUD.labelText = @"";
    }
    self.activityIndicatorCount++;
    [self.progressActivityHUD show:YES];
}
- (void)hidden{
    self.activityIndicatorCount--;
    if (self.activityIndicatorCount < 0) {
        self.activityIndicatorCount = 0;
        
    }
    if (self.activityIndicatorCount == 0){
        [self.progressActivityHUD hide:YES];
    }
}
- (void)close{
    self.activityIndicatorCount = 0;
    [self.progressActivityHUD hide:YES];
    
}
//进度Determinate
- (void)addDeterminateHUDToView:(UIView *)showView{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:showView];
    [showView addSubview:HUD];
    HUD.mode = MBProgressHUDModeDeterminate;
    HUD.labelText = @"Loading";
    [HUD showWhileExecuting:@selector(progressTask:) onTarget:self withObject:nil animated:YES];
}
- (void)progressTask:(MBProgressHUD *)hud{
    if (self.determinateBlock) {
        self.determinateBlock(hud);
    }
}

//完成custom
- (void)addCompletedHUDToView:(UIView *)showView{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:showView];
    [showView addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = @"完成";
    [HUD show:YES];
    [HUD hide:YES afterDelay:1.5];

}
//文字提示Lable
- (void)addTextHUDToView:(UIView *)showView Text:(NSString *)text{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:showView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:1.5];

}
@end
