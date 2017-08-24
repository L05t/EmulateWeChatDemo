//
//  DiscoverViewController.m
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/23.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverTableViewCell.h"
#import "TimeLineViewController.h"

static NSString *KDiscoverTableViewCell = @"DiscoverTableViewCell";

@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *dataList;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DiscoverViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataList = @[@[@"朋友圈"],@[@"扫一扫",@"摇一摇"],@[@"附近的人"],@[@"购物",@"游戏"]];
    [self.tableView registerNib:[UINib nibWithNibName:KDiscoverTableViewCell bundle:nil] forCellReuseIdentifier:KDiscoverTableViewCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - UITableViewDelegate,UITableViewDataSource



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KDiscoverTableViewCell forIndexPath:indexPath];
    cell.titleLabel.text = dataList[indexPath.section][indexPath.row];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 2;
            break;
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.row == 0) {
        TimeLineViewController *timeLineVC = [[TimeLineViewController alloc] init];
        [self.navigationController pushViewController:timeLineVC animated:YES];
    }
}

@end
