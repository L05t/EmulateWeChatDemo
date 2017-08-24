//
//  CommentTableViewCell.m
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/24.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "CommentTableViewCell.h"

@interface CommentTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation CommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithModel:(CommentModel *)model {
    NSString *str  = nil;
    if (![model.commentByUserName isEqualToString:@""]) {
        str= [NSString stringWithFormat:@"%@回复%@：%@",
              model.commentUserName, model.commentByUserName, model.commentText];
    }else{
        str= [NSString stringWithFormat:@"%@：%@",
              model.commentUserName, model.commentText];
    }
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor orangeColor]
                 range:NSMakeRange(0, model.commentUserName.length)];
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor orangeColor]
                 range:NSMakeRange(model.commentUserName.length + 2, model.commentByUserName.length)];
    self.contentLabel.attributedText = text;
}

- (void)configCellWithLikeUsers:(NSArray *)likeUsers{
    NSString *allString = @"";
    for (NSString *name in likeUsers) {
        allString = [NSString stringWithFormat:@"%@,%@",allString,name];
    }
    self.contentLabel.text = [allString substringFromIndex:1];}

@end
