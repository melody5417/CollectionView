//
//  AppDelegate.m
//  CustomCollectionView
//
//  Created by yiqiwang(王一棋) on 2017/6/8.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) ViewController *viewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];

    self.window.rootViewController = navigationController;
    self.window.backgroundColor    = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}



@end
