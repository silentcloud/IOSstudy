//
//  AboutViewController.h
//  TabNav
//
//  Created by silentcloud on 10/31/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSArray *dataList;
@property (nonatomic, retain) UITableView *myTableView;
@property (strong, nonatomic) NSArray *controllerList;

@end
