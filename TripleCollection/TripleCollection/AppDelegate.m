//
//  AppDelegate.m
//  TripleCollection
//
//  Created by yiqiwang(王一棋) on 2017/6/8.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HorizontalLineLayout.h"

@interface AppDelegate ()
@property (strong, nonatomic) ViewController *viewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UICollectionViewLayout* layout = [[HorizontalLineLayout alloc] init];
    self.viewController = [[ViewController alloc] initWithCollectionViewLayout:layout];

    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
