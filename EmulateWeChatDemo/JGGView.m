//
//  JGGView.m
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/28.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "JGGView.h"
#import <UIImageView+WebCache.h>


@interface JGGView ()
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img6;
@property (weak, nonatomic) IBOutlet UIImageView *img7;
@property (weak, nonatomic) IBOutlet UIImageView *img8;
@property (weak, nonatomic) IBOutlet UIImageView *img9;

@property (copy, nonnull) NSString *img;

@end

@implementation JGGView

- (instancetype)initWithJGGViewFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)showView:(UIView *)view{
    [view addSubview:self];
}


- (void)showView:(UIView *)view list:(NSArray *)list{
    [view addSubview:self];
    
//    for (int i = 0 ; i < [list count]; i ++) {
//        
//    }
//    
}



@end
