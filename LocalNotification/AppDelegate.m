//
//  AppDelegate.m
//  LocalNotification
//
//  Created by 金子修一郎 on 2014/09/01.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // launchOptions から UILocalNotifiation 情報を取得
    UILocalNotification *localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = _viewController;
    
    
    if (localNotif) {
        // 通知イベントで送られてきた情報（文字列）をメイン画面のラベルに表示します。
        NSString *itemName = [localNotif.userInfo objectForKey:@"EventKey"];
        [self.viewController updateLabel:itemName];
        
        // アイコンに右肩に表示されていた数字をカウントダウンします。
        // ここでは数字が０になり、アイコンの右肩の赤丸表示がなくなります。
        application.applicationIconBadgeNumber = localNotif.applicationIconBadgeNumber-1;
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notif {
    
    // 通知イベントで送られてきた情報（文字列）をメイン画面のラベルに表示します。
    NSString *itemName = [notif.userInfo objectForKey:@"EventKey"];
    [_viewController updateLabel:itemName];
    
    // アイコンに右肩に表示されていた数字をカウントダウンします。
    // ここでは数字が０になり、アイコンの右肩の赤丸表示がなくなります。
    application.applicationIconBadgeNumber = notif.applicationIconBadgeNumber-1;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    // バッヂクリア
    [_viewController clearNotification];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
