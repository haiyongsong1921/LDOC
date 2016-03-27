//
//  UserInfoViewController.h
//  LDOC
//
//  Created by haiMac on 15/5/26.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#ifndef LDOC_UserInfoViewController_h
#define LDOC_UserInfoViewController_h

#import <UIKit/UIKit.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#import "UIButton+Image.h"
#import "UserInfo.h"


@interface UserInfoViewController : UIViewController<NSStreamDelegate>

@property (nonatomic, assign) IBOutlet UIButton *btnGetUserInfo;
@property (nonatomic, assign) IBOutlet UITextField *userName;
@property (nonatomic, assign) IBOutlet UITextField *userPwd;
@property (nonatomic, assign) IBOutlet UITextField *userPhone;
@property (nonatomic, assign) IBOutlet UITextField *userSex;
@property (nonatomic, assign) IBOutlet UITextField *userAge;

@property (nonatomic, retain) NSInputStream* inputStream;
@property (nonatomic, retain) NSOutputStream* outputStream;
@property(nonatomic) struct _userInfo*  pUserInfo;

-(IBAction)btnGetInfoClicked:(id)sender;
-(void)initNetworkCommunication;
-(void)CreateUserInfoList :(char*) pRecv;

@end

#endif
