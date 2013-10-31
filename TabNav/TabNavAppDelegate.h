//
//  TabNavAppDelegate.h
//  TabNav
//
//  Created by silentcloud on 10/30/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TutorialViewController;

@interface TabNavAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) TutorialViewController *tutoriaViewController;
@property (nonatomic, strong) IBOutlet UITabBarController *mainTabBarController;

- (void)loadMainView;
-(void)loadTutoriaView;

@end
