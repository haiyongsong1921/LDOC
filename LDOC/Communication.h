//
//  Communication.h
//  LDOC
//
//  Created by haiMac on 15/6/17.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Communication : NSObject <NSStreamDelegate>

//向服务器发指令
-(BOOL)updateServer:(NSInteger) nChoice;
//获取服务器信息
-(BOOL)downloadFromServer:(NSInteger) nChoice;
//客户端登陆
-(BOOL)loginClient;

@end
