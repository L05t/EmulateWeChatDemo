//
//  TimeLineTableHeaderView.h
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/24.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineTableHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *bigView;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;


- (instancetype)initWithHeaderViewFrame:(CGRect)frame;

@end
