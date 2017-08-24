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
#import "CommentTableViewCell.h"
#import <Masonry.h>

static NSString *KCommentTableViewCell = @"CommentTableViewCell";

@interface TimeLineTableViewCell ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TimeLineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.tableView registerNib:[UINib nibWithNibName:KCommentTableViewCell bundle:nil] forCellReuseIdentifier:KCommentTableViewCell];

    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MessageModel *)model{
    _model = model;
    self.nickNameLabel.text = model.userName;
    self.contentLabel.text = model.message;
    [self.photo sd_setImageWithURL:[NSURL URLWithString:model.photo] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
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
    
    NSInteger index = self.model.likeUsers.count?(indexPath.row-1):(indexPath.row);
    CommentModel *model = [self.model.commentMessages objectAtIndex:index];
    [cell configCellWithModel:model];
    return cell;
}





@end
