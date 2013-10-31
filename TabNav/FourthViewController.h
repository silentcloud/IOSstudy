//
//  FourthViewController.h
//  TabNav
//
//  Created by silentcloud on 10/30/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSArray *dataList1;
@property (nonatomic, strong) NSArray *dataList2;
@property (nonatomic, strong) NSArray *dataList3;
@property (nonatomic, strong) UITableView *myTableView;
@property (strong, nonatomic) NSArray *controllerList;

@end
