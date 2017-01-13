//
//  LLMoment.h
//  AliPay_Moment_Demo
//
//  Created by locklight on 17/1/6.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLMoment : NSObject
//头像
@property (nonatomic, copy) NSString *icon;
//昵称
@property (nonatomic, copy) NSString *name;
//内容
@property (nonatomic, copy) NSString *content;
//图片
@property (nonatomic, copy) NSString *picture;
//时间
@property (nonatomic, copy) NSString *time;
//是否显示删除
@property (nonatomic, assign) BOOL isMine;

+ (instancetype)momentWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
