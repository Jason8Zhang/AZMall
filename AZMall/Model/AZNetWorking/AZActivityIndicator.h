//
//  AZActivityIndicator.h
//  tryAFNetworking
//
//  Created by jason on 15/9/16.
//  Copyright © 2015年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface AZActivityIndicator : NSObject{
    MBProgressHUD *_progressActivityHUD;
    NSInteger _activityIndicatorCount;
}
@property (nonatomic,retain)MBProgressHUD *progressActivityHUD;
@property (nonatomic,assign)NSInteger *activityIndicatorCount;
@property (nonatomic,retain)void (^determinateBlock)(MBProgressHUD *);

- (void)addHUDToView:(UIView*)showView;
- (void)show;
- (void)showWithLabelText:(NSString*)labelText;
- (void)hidden;
- (void)close;
//进度Determinate
- (void)addDeterminateHUDToView:(UIView *)showView;
//完成custom
- (void)addCompletedHUDToView:(UIView *)showView;
//文字提示Lable
- (void)addTextHUDToView:(UIView *)showView Text:(NSString *)text;
@end
