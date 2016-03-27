//
//  MySocket.h
//  LDOC
//
//  Created by haiMac on 15/6/30.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface MySocket : NSObject <NSStreamDelegate>
-(BOOL)Create:(int) nType;
@property(nonatomic, )NSInteger m_nSocket;

@end
