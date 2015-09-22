//
//  AZNetWorking.h
//  tryAFNetworking
//
//  Created by jason on 15/9/15.
//  Copyright © 2015年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AZActivityIndicator.h"
typedef NS_ENUM(NSInteger,AZNetworkResponseType) {
    AZNetworkResponseType_JSON,
    AZNetworkResponseType_STRING,
    AZNetworkResponseType_DATA
};
@interface AZNetWorking : NSObject{
    AZNetworkResponseType _responseType;
    AZActivityIndicator *_activityIndicator;
}
@property (nonatomic,assign) AZNetworkResponseType responseType;
@property (nonatomic,strong) AZActivityIndicator *activityIndicator;
-(void )networkReachable;
-(void)postHttpTransactionWithHostName:(NSString *)hostName hostPath:(NSString *)hostPath useSSL:(BOOL)useSSL withPara:(NSDictionary *)dicPara sucessBlock:(void(^)(id response))sucessBlock failBlock:(void(^)(NSError *error))failBlock;
-(void)cancel;
@end
