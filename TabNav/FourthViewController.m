//
//  FourthViewController.m
//  TabNav
//
//  Created by silentcloud on 10/30/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "FourthViewController.h"
#import "AboutViewController.h"

@implementation FourthViewController

@synthesize dataList = _dataList;
@synthesize dataList1 = _dataList1;
@synthesize dataList2 = _dataList2;
@synthesize dataList3 = _dataList3;
@synthesize myTableView = _myTableView;
@synthesize controllerList = _controllerList;

-(void)viewDidLoad
{
    self.navigationItem.title = @"安全";
    [super viewDidLoad];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
                                                    style:UITableViewStyleGrouped];
    self.myTableView.dataSource = self;
    CGFloat light  = (CGFloat) 240/255.0;
    self.myTableView.backgroundColor = [UIColor colorWithRed:light green:light blue:light alpha:1];
    // 设置tableView的委托
    self.myTableView.delegate = self;
    [self.view addSubview:self.myTableView];

    self.dataList1 = [[NSArray alloc] initWithObjects:@"安全体检", @"密码管理", @"支付设置", @"账户管理", nil];
    self.dataList2 = [[NSArray alloc] initWithObjects:@"手机宝令", @"支付宝服务中心", nil];
    self.dataList3 = [[NSArray alloc] initWithObjects:@"消息通知", @"关于", nil];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    AboutViewController *aboutView = [[AboutViewController alloc]init];
    //aboutView.title = @"";
    [array addObject:aboutView];
    self.controllerList = array;
}

//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return  [self.dataList1 count];
            break;
        case 1:
            return  [self.dataList2 count];
            break;
        case 2:
            return  [self.dataList3 count];
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    cell.accessoryType = UITableViewCellSelectionStyleBlue;
    switch (indexPath.section) {
        case 0:
            [[cell textLabel]  setText:[self.dataList1 objectAtIndex:indexPath.row]];
            break;
        case 1:
            [[cell textLabel]  setText:[self.dataList2 objectAtIndex:indexPath.row]];
            break;
        case 2:
            [[cell textLabel]  setText:[self.dataList3 objectAtIndex:indexPath.row]];
            break;
        default:
            [[cell textLabel]  setText:@"Unknown"];
            
    }
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
    switch (indexPath.section) {
        case 0:
        {
            NSString *msg0 = [[NSString alloc] initWithFormat:@"%@",[self.dataList1 objectAtIndex:[indexPath row]]];
            UIAlertView *alert0 = [[UIAlertView alloc] initWithTitle:nil message:msg0 delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert0 show];
            break;
        }
        case 1:
        {
            NSString *msg1 = [[NSString alloc] initWithFormat:@"%@",[self.dataList2 objectAtIndex:[indexPath row]]];
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:nil message:msg1 delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert1 show];
            break;
        }
        case 2:
        {
            if([indexPath row] == 1){
                UITableViewController *nextController = [self.controllerList objectAtIndex:0];
                [self.navigationController pushViewController:nextController animated:YES];
            }
            break;
        }
        default:
            break;
    }
}


@end
