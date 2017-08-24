//
//  TimeLineViewController.m
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/23.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "TimeLineViewController.h"
#import "MessageModel.h"
#import "TimeLineTableViewCell.h"
#import "TimeLineTableHeaderView.h"


static NSString *KTimeLineTableViewCell = @"TimeLineTableViewCell";

@interface TimeLineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat reloadCellHeight;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet TimeLineTableHeaderView *headerView;

@end

@implementation TimeLineViewController


-(NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"朋友圈";
    self.tableView.tableFooterView = [[UIView alloc] init];

    [self.tableView registerNib:[UINib nibWithNibName:KTimeLineTableViewCell bundle:nil] forCellReuseIdentifier:KTimeLineTableViewCell];
    
    TimeLineTableHeaderView *headerView = [[TimeLineTableHeaderView alloc] initWithHeaderViewFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    
    [self.tableView setTableHeaderView:headerView];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]]];
    NSDictionary *JSONDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    for (NSDictionary *eachDic in JSONDic[@"data"][@"rows"]) {
        MessageModel *messageModel = [[MessageModel alloc] initWithJSONDict:eachDic];
        [self.dataSource addObject:messageModel];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *indexString = [NSString stringWithFormat:@"%zd",indexPath.row];
    NSLog(@"cellForRowAtIndexPath方法%@",indexString);
//    textTabelViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KtextTabelViewCellTableViewCell forIndexPath:indexPath];
    TimeLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KTimeLineTableViewCell];

    cell.model = self.dataSource[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *indexString = [NSString stringWithFormat:@"%zd",indexPath.row];
//    NSLog(@"heightForRowAtIndexPath方法%@",indexString);
//    id model = self.dataSource[indexPath.row];
//    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[textTabelViewCellTableViewCell class] contentViewWidth:246];
//    return reloadCellHeight;
//}

#pragma mark - textTableViewCellTableViewCellDelegate

- (void)reloadIndexPathCell:(CGFloat)cellHeight indexPath:(NSIndexPath *)indexPath{
    reloadCellHeight = cellHeight;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}



@end
