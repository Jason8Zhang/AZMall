//
//  AppDelegate.m
//  AZMall
//
//  Created by jason on 15/9/10.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "LoginViewController.h"
#import "FPSingle.h"
#import "MainSuperViewController.h"
#import "IQKeyboardManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Override point for customization after application launch.
//    UINavigationController *rootNavi = [[UINavigationController alloc] initWithRootViewController:[FPSingle sharedInstance].mainVC.centerController];
//    [FPSingle sharedInstance].naviVC = rootNavi;
//    
//    self.window.rootViewController = [FPSingle sharedInstance].mainVC.homeVC;
    //键盘遮挡textField 自动弹起框架
    //Enabling keyboard manager(Use this line to enable managing distance between keyboard & textField/textView).
    [[IQKeyboardManager sharedManager] setEnable:YES];
    
    //(Optional)Set Distance between keyboard & textField, Default is 10.
    [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:15];

    MainSuperViewController *rootVC = [MainSuperViewController new];
    self.window.rootViewController = rootVC;
    [FPSingle sharedInstance].mainVC = rootVC;
    
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
