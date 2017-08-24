//
//  CommentModel.h
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/24.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "BaseModel.h"

@interface CommentModel : BaseModel

@property (nonatomic, assign) BOOL isExpand;

@property(nonatomic,copy)NSString *commentId;
@property(nonatomic,copy)NSString *commentUserId;
@property(nonatomic,copy)NSString *commentUserName;
@property(nonatomic,copy)NSString *commentPhoto;
@property(nonatomic,copy)NSString *commentText;
@property(nonatomic,copy)NSString *commentByUserId;
@property(nonatomic,copy)NSString *commentByUserName;
@property(nonatomic,copy)NSString *commentByPhoto;
@property(nonatomic,copy)NSString *createDateStr;
@property(nonatomic,copy)NSString *createDate;
@property(nonatomic,assign)BOOL checkStatus;

@end

/*
 {
 checkStatus = YES;
 commentByPhoto = "";
 commentByUserId = "";
 commentByUserName = "";
 commentId = 1;
 commentPhoto = "http://wanka-chemo.oss-cn-beijing.aliyuncs.com/head_photo/iOS_201708241040503622.jpg";
 commentText = 23333333;
 commentUserId = 97;
 commentUserName = "\U5434\U5f66\U7956";
 createDate = 1463641914000;
 createDateStr = "2016-05-19 15:11";
 }
*/
