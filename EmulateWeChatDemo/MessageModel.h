//
//  MessageModel.h
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/23.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import "BaseModel.h"

@interface MessageModel : BaseModel

@property (copy, nonatomic) NSString *message_type;
@property (strong, nonatomic) NSNumber *cid;
@property (strong, nonatomic) NSNumber *message_id;
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *photo;
@property (copy, nonatomic) NSString *message;
@property (copy, nonatomic) NSString *timeString;
@property (copy, nonatomic) NSString *createDate;
@property (copy, nonatomic) NSString *timeTag;
@property (copy, nonatomic) NSString *objId;
@property (assign, nonatomic) BOOL checkStatus;
@property (strong, nonatomic) NSNumber *userId;
@property (copy, nonatomic) NSString *createDateStr;
@property (copy, nonatomic) NSArray *likeUsers;
@property (copy, nonatomic) NSArray *messageBigPics;
@property (copy, nonatomic) NSArray *commentMessages;
@property (copy, nonatomic) NSArray *messageSmallPics;

@property (strong, nonatomic) NSIndexPath *indexPath;
@end
