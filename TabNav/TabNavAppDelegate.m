//
//  TabNavAppDelegate.m
//  TabNav
//
//  Created by silentcloud on 10/30/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "TabNavAppDelegate.h"
#import "TutorialViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@implementation TabNavAppDelegate

@synthesize window = _window;
@synthesize tutoriaViewController = _tutoriaViewController;
@synthesize mainTabBarController = _mainTabBarController;

-(void)loadTutoriaView
{
    self.tutoriaViewController = [[TutorialViewController alloc]init];
    [self.window addSubview:self.tutoriaViewController.view];
}

-(void)loadMainView
{
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    UINavigationController *alipayNav = [[UINavigationController alloc]
                                         initWithRootViewController: firstViewController];
    alipayNav.navigationBar.tintColor = [UIColor whiteColor];
    alipayNav.navigationBar.barStyle = UIBarStyleBlack;
    UITabBarItem *alipayTab = [[UITabBarItem alloc] initWithTitle: @"支付宝" image:nil tag: 0];
    alipayNav.tabBarItem = alipayTab;
    alipayNav.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]
                                                                   pathForResource:@"home" ofType:@"png"]];
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    UINavigationController *recordNav = [[UINavigationController alloc]
                                         initWithRootViewController: secondViewController];
    recordNav.navigationBar.tintColor = [UIColor whiteColor];
    recordNav.navigationBar.barStyle = UIBarStyleBlack;
    UITabBarItem *recordTab = [[UITabBarItem alloc] initWithTitle: @"账单" image: nil tag: 1];
    recordNav.tabBarItem = recordTab;
    recordNav.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]
                                                                   pathForResource:@"bill" ofType:@"png"]];
    
    ThirdViewController *thirdViewControlle = [[ThirdViewController alloc] init];
    UINavigationController *assetNav = [[UINavigationController alloc]
                                        initWithRootViewController: thirdViewControlle];
    assetNav.navigationBar.tintColor = [UIColor whiteColor];
    assetNav.navigationBar.barStyle = UIBarStyleBlack;
    UITabBarItem *assetTab = [[UITabBarItem alloc] initWithTitle: @"我的资产" image:nil tag: 0];
    assetNav.tabBarItem = assetTab;
    assetNav.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]
                                                                   pathForResource:@"assets" ofType:@"png"]];
    
    FourthViewController *fourthViewController = [[FourthViewController alloc] init];
    UINavigationController *safetyNav = [[UINavigationController alloc]
                                         initWithRootViewController: fourthViewController];
    safetyNav.navigationBar.tintColor = [UIColor whiteColor];
    safetyNav.navigationBar.barStyle = UIBarStyleBlack;
    UITabBarItem *safetyTab = [[UITabBarItem alloc] initWithTitle: @"安全" image: nil tag: 1];
    safetyNav.tabBarItem = safetyTab;
    safetyNav.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]
                                                                   pathForResource:@"safety" ofType:@"png"]];
    
    self.mainTabBarController = [[UITabBarController alloc] init];
    
    self.mainTabBarController.viewControllers = [NSArray arrayWithObjects: alipayNav, recordNav, assetNav, safetyNav,nil];
    
    [self.window addSubview: self.mainTabBarController.view];
    
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self loadTutoriaView];
    //self.window.rootViewController = tabBarController.view;
    //[self.window addSubview: tabBarController.view];
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
