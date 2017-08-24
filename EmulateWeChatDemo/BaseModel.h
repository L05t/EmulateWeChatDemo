//
//  BaseModel.h
//  EmulateWeChatDemo
//
//  Created by shuidi_iMac on 2017/8/23.
//  Copyright © 2017年 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (instancetype)initWithJSONDict:(NSDictionary *)dict;

- (void)initializeWithDict:(NSDictionary *)dict;

-(NSString *)description;

@end
