//
//  CommentTableViewCell.h
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/24.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface CommentTableViewCell : UITableViewCell

///处理点赞的人列表
- (void)configCellWithLikeUsers:(NSArray *)likeUsers;
///处理评论的文字（包括xx回复yy）
- (void)configCellWithModel:(CommentModel *)model;
@end
