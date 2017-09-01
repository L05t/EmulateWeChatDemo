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
//#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>

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


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    CGFloat height = [tableView fd_heightForCellWithIdentifier:KTimeLineTableViewCell cacheByIndexPath:indexPath configuration:^(TimeLineTableViewCell *cell) {
//        [self configureCell:cell atIndexPath:indexPath];
//    }];
//    return height;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *indexString = [NSString stringWithFormat:@"%zd",indexPath.row];
    NSLog(@"填装cell的方法%@",indexString);
    TimeLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KTimeLineTableViewCell];
    cell.model = self.dataSource[indexPath.row];

//    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(TimeLineTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    cell.fd_enforceFrameLayout = NO;
    cell.model = self.dataSource[indexPath.row];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}




@end
