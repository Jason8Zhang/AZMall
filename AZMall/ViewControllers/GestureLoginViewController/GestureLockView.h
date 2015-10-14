//
//  GestureLockView.h
//  AZMall
//
//  Created by jason on 15/9/28.
//  Copyright © 2015年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GestureLockView;
@protocol GestureLockDelegate <NSObject>
@required
-(void)gestureLockString: (NSString *)lockString;

@end

@interface GestureLockView : UIView
{
    
}
@property (nonatomic,weak) id<GestureLockDelegate>delegate;

@end
