//
//  RootViewController.m
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/23.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "RootViewController.h"
#import "BaseNavigationController.h"


static NSString *KClassKey = @"rootVCClassString";//所属控制器
static NSString *KTitle = @"title";//标题
static NSString *KNormalImg = @"NormalImg";//非点击图片
static NSString *KSelectImg = @"SelectImg";//点击图片



@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *itemArray = @[@{KClassKey:@"",KTitle:@"微信",KNormalImg:@"tabbar_first_normal",KSelectImg:@"tabbar_first_selected"},
                           @{KClassKey:@"",KTitle:@"通讯录",KNormalImg:@"tabbar_second_normal",KSelectImg:@"tabbar_second_selected"},
                           @{KClassKey:@"DiscoverViewController",KTitle:@"发现",KNormalImg:@"tabbar_third_normal",KSelectImg:@"tabbar_first_selected"},
                           @{KClassKey:@"",KTitle:@"我",KNormalImg:@"tabbar_fourth_normal",KSelectImg:@"tabbar_fourth_selected"},
                           ];

    [itemArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [NSClassFromString(dict[KClassKey]) new];
        vc.title = dict[KTitle];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[KTitle];
        item.image = [UIImage imageNamed:dict[KNormalImg]];
        item.selectedImage = [[UIImage imageNamed:dict[KSelectImg]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
