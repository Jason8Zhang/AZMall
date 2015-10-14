//
//  GestureLoginViewController.h
//  AZMall
//
//  Created by jason on 15/9/28.
//  Copyright © 2015年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureLockView.h"

typedef NS_ENUM(NSInteger,GestureLockViewType){
    GestureLockViewType_None,
    GestureLockViewType_Check,
    GestureLockViewType_Create,
    GestureLockViewType_Verify,
    GestureLockViewType_Modify,
    GestureLockViewType_Clean
};
@class GestureLoginViewController;
@protocol GestureLockViewControllerDelegate <NSObject>



@end
@interface GestureLoginViewController : UIViewController
@property (nonatomic ,strong) id<GestureLockViewControllerDelegate>delegate;
@property (nonatomic ,retain) GestureLockView *gestureLockView;
@property (nonatomic ,assign) GestureLockViewType gestureLockViewType;
- (instancetype) initWithGestureLockViewType:(GestureLockViewType)lockViewType;
@end
