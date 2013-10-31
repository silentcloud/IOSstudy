//
//  FirstViewController.m
//  TabNav
//
//  Created by silentcloud on 10/30/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

//@synthesize label;

-(void)viewDidLoad
{
    
    //self.navigationItem.title = @"one";
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    bgImageView.backgroundColor = [UIColor clearColor];
    bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg1" ofType:@"png"]];
    [self.view addSubview:bgImageView];
    
    [super viewDidLoad];
}

@end
