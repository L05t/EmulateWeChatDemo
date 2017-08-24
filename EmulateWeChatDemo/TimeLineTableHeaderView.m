//
//  TimeLineTableHeaderView.m
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/24.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "TimeLineTableHeaderView.h"
#import "UIImageView+WebCache.h"

@implementation TimeLineTableHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.bigView setImage:[UIImage imageNamed:@"pbg.png"]];
    [self.photoView sd_setImageWithURL:[NSURL URLWithString:@"http://wanka-chemo.oss-cn-beijing.aliyuncs.com/head_photo/iOS_201708241040503622.jpg"] placeholderImage:nil];
    
}

- (instancetype)initWithHeaderViewFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
        self.frame = frame;
    }
    return self;
}

@end
