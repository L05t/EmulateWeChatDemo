//
//  TimeLineTableViewCell.m
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/24.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "TimeLineTableViewCell.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "CommentTableViewCell.h"
#import "CommentModel.h"
#import <Masonry.h>
#import "JGGView.h"
static NSString *KCommentTableViewCell = @"CommentTableViewCell";

@interface TimeLineTableViewCell ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *jggView;
@property (nonatomic, strong) JGGView *jggViewObj;
@property (strong, nonatomic) CommentTableViewCell *tableViewCell;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jggViewHeight;
@end

@implementation TimeLineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:KCommentTableViewCell bundle:nil] forCellReuseIdentifier:KCommentTableViewCell];
    
#warning 没有这句话，label不折行
//    self.contentLabel.preferredMaxLayoutWidth = self.contentLabel.frame.size.width;

    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 14;
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(100);
//    }];
//
//    self.jggViewObj = [[JGGView alloc] initWithJGGViewFrame:self.jggView.frame];
//    [self.jggView addSubview:self.jggViewObj];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MessageModel *)model{
    _model = model;
    
    
    if ([self.jggView.subviews count]>0) {
        [self.jggView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    
    self.nickNameLabel.text = model.userName;
    self.contentLabel.text = model.message;
    [self.photo sd_setImageWithURL:[NSURL URLWithString:model.photo] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
//    [self.jggView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if ([model.messageBigPics count] == 0) {
        self.jggViewHeight.constant = 0;
//        [self.jggView removeFromSuperview];
    }else{
        CGFloat x=2.5,y=2.5,w=80,h=80;
        for (int i =0; i < [model.messageBigPics count]; i ++) {
            UIImageView *img = [[UIImageView alloc] init];
            [img sd_setImageWithURL:model.messageBigPics[i] placeholderImage:[UIImage imageNamed:@""]];
            [self.jggView addSubview:img];
        if ([model.messageBigPics count] <= 3){
            self.jggViewHeight.constant = 85;
            [img mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(self.jggView.mas_leading).offset(x*(i+1) + i*w);
                make.centerY.equalTo(self.jggView.mas_centerY);
                make.size.mas_equalTo(CGSizeMake(w, h));
            }];
        }else if ([model.messageBigPics count] <= 6){
            self.jggViewHeight.constant = 167.5;
        }else{
            self.jggViewHeight.constant = 250;
        }
    }
    }
//    [self.jggView showView:self.JGGView];
    self.timeLabel.text = model.timeTag;

}
#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = self.model.commentMessages.count;
    if (self.model.likeUsers.count) {
        return count+1;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCommentTableViewCell];
    if (self.model.likeUsers.count) {
        if (indexPath.row == 0) {
            [cell configCellWithLikeUsers:self.model.likeUsers];
            return cell;
        }
    }
    
    NSInteger index = self.model.likeUsers.count?indexPath.row - 1:indexPath.row;
    CommentModel *model = [[CommentModel alloc] initWithJSONDict:[self.model.commentMessages objectAtIndex:index]];
    [cell configCellWithModel:model];
    return cell;
}





@end
