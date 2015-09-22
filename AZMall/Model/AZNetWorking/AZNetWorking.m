//
//  AZNetWorking.m
//  tryAFNetworking
//
//  Created by jason on 15/9/15.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "AZNetWorking.h"

@implementation AZNetWorking{
    AFHTTPRequestOperationManager *manager;
     NSInteger networkStatus;
    UIView *hudView;
}
@synthesize activityIndicator;
@synthesize responseType;
-(instancetype)init{
    if (self = [super init]) {
        hudView = [[[UIApplication sharedApplication] delegate] window];
        manager = [AFHTTPRequestOperationManager manager];
        self.responseType = AZNetworkResponseType_JSON;
        if (hudView) {
            self.activityIndicator = [AZActivityIndicator new];
            [self.activityIndicator addHUDToView:hudView];
        }
    }
    return self;
}

-(instancetype)initWithHUDView:(UIView *)hud{
    if(self = [super init]) {
        hudView = hud;
        self.responseType = AZNetworkResponseType_JSON;
        if (hudView) {
            self.activityIndicator = [AZActivityIndicator new];
            [self.activityIndicator addHUDToView:hudView];
        }

    }
    return self;
}
-(void)networkReachable{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络,不花钱
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        networkStatus = status;
    }];

}
-(void)postHttpTransactionWithHostName:(NSString *)hostName hostPath:(NSString *)hostPath useSSL:(BOOL)useSSL withPara:(NSDictionary *)dicPara sucessBlock:(void(^)(id response))sucessBlock failBlock:(void(^)(NSError *error))failBlock{
    NSString *strURL = [NSString stringWithFormat:@"%@%@/%@",useSSL?@"https://":@"http://",hostName,hostPath];
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    
//    [AFHTTPRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [serializer setValue:@"zh-CN,zh;q=0.8" forHTTPHeaderField:@"Accept-Language"];
    [serializer setValue:@"Keep-Alive" forHTTPHeaderField:@"Connection"];
    [serializer setValue:@"text/xml,application/json,text/html" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = serializer;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型 
    NSLog(@"url地址看我:%@",strURL);
    [manager POST:strURL parameters:dicPara success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (sucessBlock) {
            NSLog(@"交易发送成功！！！");
            sucessBlock(responseObject);
            [activityIndicator show];
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if (failBlock) {
            NSLog(@"交易发送失败！！！");
            failBlock(error);
            [activityIndicator hidden];
        }
    }];
}

-(void)cancel{
    [manager.operationQueue cancelAllOperations];
}
-(void)analysisError:(NSError *)error{
    NSString *strErrorMessage = nil;
    switch (error.code) {
        case -1004:
            strErrorMessage = @"连接不到服务器";
            break;
        case -1001:
            strErrorMessage = @"请求超时";
            break;
        default:
            break;
    }
    if (strErrorMessage) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示"
                                                        message:[NSString stringWithFormat:@"%@",strErrorMessage]
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        NSLog(@"网络信息错误,错误详情看我==>\n%@",error);
    }
}
@end
