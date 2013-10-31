//
//  ThirdViewController.m
//  TabNav
//
//  Created by silentcloud on 10/30/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "ThirdViewController.h"

@implementation ThirdViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"我的资产";
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    bgImageView.backgroundColor = [UIColor clearColor];
    bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg3" ofType:@"png"]];
    [self.view addSubview:bgImageView];
    
    [super viewDidLoad];
}

@end
