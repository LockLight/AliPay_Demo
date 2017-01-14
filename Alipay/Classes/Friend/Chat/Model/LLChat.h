//
//  LLChat.h
//  Alipay
//
//  Created by locklight on 17/1/13.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LLChatTypeOther,
    LLChatTypeMe,
}LLChatType;

@interface LLChat : NSObject
//消息时间
@property (nonatomic, copy) NSString *time;
//消息内容
@property (nonatomic, copy) NSString *text;
//消息类型
@property (nonatomic, assign) LLChatType type;
@end
