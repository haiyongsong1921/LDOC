//
//  MySocket.m
//  LDOC
//
//  Created by haiMac on 15/6/30.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import "MySocket.h"


@implementation MySocket
-(BOOL)Create:(int) nType;
{
    int fd=socket(AF_INET, nType  , 0);
    BOOL success=(fd!=-1);
    if (!success) {
        
    }
    return success;
}

@end
