//
//  AboutViewController.m
//  TabNav
//
//  Created by silentcloud on 10/31/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "AboutViewController.h"
#import "FeedBackViewController.h"

@implementation AboutViewController

@synthesize dataList,myTableView,controllerList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1];
    
    self.navigationItem.title = @"关于";
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIImageView  *imageView=[[UIImageView alloc] initWithFrame:
                             CGRectMake(floor(self.view.bounds.size.width - 57)/2, 93, 57, 57)];
    [imageView setImage:[UIImage imageNamed:@"roundcorner@2x.png"]];
    imageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageView];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake(0, 164 , self.view.bounds.size.width, 20)];
    versionLabel.text = @"版本号:7.6.0";
    //versionLabel.font = [UIFont systemFontSize];
    CGFloat color999 = (CGFloat) 153/255.0;
    versionLabel.textColor = [UIColor colorWithRed:color999 green:color999 blue:color999 alpha:1];
    versionLabel.font = [UIFont systemFontOfSize:15];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    //self.versionLabel.center = self.view.center;
    //设置阴影
    versionLabel.shadowColor = [UIColor whiteColor];
    versionLabel.shadowOffset = CGSizeMake(0.7,0.7);
    [self.view addSubview:versionLabel];
    
    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    // 初始化tableView的数据
    NSArray *list = [NSArray arrayWithObjects:@"检测更新",@"版本说明",@"反馈",@"去评分", nil];
    self.dataList = list;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 192.0f, 320.0f, 202.0f) style:UITableViewStyleGrouped];
    //tableView.center = CGPointMake(100.0f, 160.0f);
    // 设置tableView的数据源
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.dataSource = self;//?????
    CGFloat light  = (CGFloat) 240/255.0;
    tableView.backgroundColor = [UIColor colorWithRed:light green:light blue:light alpha:1];
    // 设置tableView的委托
    tableView.delegate = self;
    self.myTableView = tableView;
    [self.view addSubview:myTableView];
    
    UIImageView  *logoView=[[UIImageView alloc] initWithFrame:
                            CGRectMake(floor(self.view.bounds.size.width - 55)/2,
                                       self.view.bounds.size.height - 56, 55, 18)];
    [logoView setImage:[UIImage imageNamed:@"logo@2x.png"]];
    [self.view addSubview:logoView];
    
    UILabel *copyrightLabel = [[UILabel alloc] initWithFrame:
                               CGRectMake(0, self.view.bounds.size.height - 33 , self.view.bounds.size.width, 20)];
    copyrightLabel.text = @"Copyright© 2004-2013 ALIPAY.COM. All Rights Reserved.";
    //versionLabel.font = [UIFont systemFontSize];
    CGFloat colorccc = (CGFloat) 204/255.0;
    copyrightLabel.textColor = [UIColor colorWithRed:colorccc green:colorccc blue:colorccc alpha:1];
    copyrightLabel.font = [UIFont systemFontOfSize:10];
    copyrightLabel.textAlignment = NSTextAlignmentCenter;
    //self.versionLabel.center = self.view.center;
    //设置阴影
    versionLabel.shadowColor = [UIColor whiteColor];
    versionLabel.shadowOffset = CGSizeMake(0.7,0.7);
    [self.view addSubview:copyrightLabel];
    
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    FeedBackViewController *subView = [[FeedBackViewController alloc]init];
    [array addObject:subView];
    self.controllerList = array;
}

-(void)selectAction
{}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.dataList objectAtIndex:row];
    //cell.imageView.image = [UIImage imageNamed:@"green.png"];
    cell.detailTextLabel.text = nil;
    cell.accessoryType = UITableViewCellSelectionStyleBlue;
    return cell;
}

//设置cell的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 43;
}

//当选择指定的cell时，弹出UIAlertView显示选择的内容
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",[indexPath row]);
    if ([indexPath row] == 2) {
        UITableViewController *nextController = [self.controllerList objectAtIndex:0];
        [self.navigationController pushViewController:nextController animated:YES];
        //go subview
    }else{
        NSString *msg = [[NSString alloc] initWithFormat:@"%@",[self.dataList objectAtIndex:[indexPath row]]];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
