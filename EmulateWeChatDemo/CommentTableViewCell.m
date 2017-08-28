//
//  CommentTableViewCell.m
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/24.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "UIDefin.h"



@interface CommentTableViewCell ()


@end

@implementation CommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentLabel.numberOfLines = 0;
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
    NSDictionary *attributesForName = @{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:14],NSForegroundColorAttributeName:RGBColor(126, 132, 154)};
    
    NSDictionary *attributesForComment = @{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:14],NSForegroundColorAttributeName:[UIColor blackColor]};

    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
    
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(self.contentView.frame.size.width, MAXFLOAT)];
    
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:text];

    self.contentLabel.textLayout = textLayout;

    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:model.commentText];

    [content addAttributes:attributesForComment range:NSMakeRange(0, model.commentText.length)];
    
    [text addAttributes:attributesForName range:NSMakeRange(0, model.commentUserName.length)];
    
    [text addAttributes:attributesForName range:NSMakeRange(model.commentUserName.length + 2, model.commentByUserName.length)];
    
    
    
//    [text appendAttributedString:[[NSAttributedString alloc] initWithString:str attributes:nil]];
//
//    [text addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, model.commentUserName.length)];
//    
//    [text addAttribute:NSFontAttributeName value:font range:NSMakeRange(model.commentUserName.length + 2, model.commentByUserName.length)];
//    
//    [text addAttribute:NSForegroundColorAttributeName
//                 value:RGBColor(126, 132, 154)
//                 range:NSMakeRange(0, model.commentUserName.length)];
//    
//    [text addAttribute:NSForegroundColorAttributeName
//                 value:RGBColor(126, 132, 154)
//                 range:NSMakeRange(model.commentUserName.length + 2, model.commentByUserName.length)];
    self.contentLabel.attributedText = text;

}

- (void)configCellWithLikeUsers:(NSArray *)likeUsers{
    NSString *allString = @"";
    for (NSString *name in likeUsers) {
        allString = [NSString stringWithFormat:@"%@,%@",allString,name];
    }
//    self.contentLabel.text = [NSString stringWithFormat:@"%@,%@",allString,name] [allString substringFromIndex:1];
    self.contentLabel.text = [NSString stringWithFormat:@"ღ%@",allString];
    self.contentLabel.textColor = RGBColor(126, 132, 154);
}

@end
