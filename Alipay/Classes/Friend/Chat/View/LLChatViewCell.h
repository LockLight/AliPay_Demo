//
//  LLChatViewCell.h
//  Alipay
//
//  Created by locklight on 17/1/13.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLChat;

@interface LLChatViewCell : UITableViewCell
//接收数据
@property (nonatomic, strong)LLChat *chat;
@end
