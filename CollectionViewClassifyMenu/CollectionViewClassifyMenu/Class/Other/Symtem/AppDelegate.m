//
//  AppDelegate.m
//  CollectionViewClassifyMenu
//
//  Created by https://github.com/ChenYilong on 15/3/17.
//  Copyright (c)  http://weibo.com/luohanchenyilong/ . All rights reserved.
//

#import "AppDelegate.h"
#import "CYLMainViewController.h"
#import "CYLFilterParamsTool.h"
#import "CYLParameterConfiguration.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //work in application:didFinishLaunchingWithOptions
    if ([UINavigationBar conformsToProtocol:@protocol(UIAppearanceContainer)]) {
        [UINavigationBar appearance].tintColor = [UIColor whiteColor];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName : [UIColor whiteColor]}];
        [[UINavigationBar appearance] setBarTintColor:CYLAppTintColor];
        [[UINavigationBar appearance] setTranslucent:NO];
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    CYLMainViewController *classifyMenuViewController = [[CYLMainViewController alloc] init];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:classifyMenuViewController];
    self.window.rootViewController = self.navigationController;
    [self.window addSubview:classifyMenuViewController.view];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self initFilterSetting:YES];
    return YES;
}

- (void)initFilterSetting:(BOOL)restore {
    if (!restore) {
        CYLFilterParamsTool *filterParamsTool = [[CYLFilterParamsTool alloc] init];
        [NSKeyedArchiver archiveRootObject:filterParamsTool toFile:filterParamsTool.filename];
    }
}

@end
