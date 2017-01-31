//
//  AppDelegate.m
//  SXNews
//
//  Created by 董 尚先 on 15-1-22.
//  Copyright (c) 2015年 ShangxianDante. All rights reserved.
//

#import "AppDelegate.h"
#import "SXMainTabBarController.h"
#import <Search-Category/Lothar+Search.h>
#import <HLNetworking/HLNetworking.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"update"];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"top20"];
    UIApplication *app = [UIApplication sharedApplication];
    app.statusBarStyle = UIStatusBarStyleLightContent;
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    [HLNetworkManager setupConfig:^(HLNetworkConfig * _Nonnull config) {
        config.request.baseURL = @"http://c.3g.163.com";
        config.request.apiVersion = nil;
    }];
    _window.rootViewController = [[SXMainTabBarController alloc] init];
    
    [_window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    if ([shortcutItem.localizedTitle isEqualToString:@"分享\"SXNews\""]) {
        NSArray *arr = @[@"share"];
        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
        [self.window.rootViewController presentViewController:vc animated:YES completion:^{

        }];
    }else if ([shortcutItem.localizedTitle isEqualToString:@"搜索"]){
        SXMainTabBarController *rootTab = (SXMainTabBarController *)self.window.rootViewController;
        UINavigationController *rootNav = rootTab.viewControllers[0];
        UIViewController *viewController = [[Lothar shared] Search_aViewControllerWithKeyword:nil];
        [rootNav pushViewController:viewController animated:YES];
    }
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
