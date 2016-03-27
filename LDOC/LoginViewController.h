//
//  LoginViewController.h
//  LDOC
//
//  Created by haiMac on 15/6/4.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#ifndef LDOC_LoginViewController_h
#define LDOC_LoginViewController_h
#import <UIKit/UIKit.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>



@interface LoginViewController : UIViewController<NSStreamDelegate>

@property (nonatomic, assign) IBOutlet UITextField *userName;
@property (nonatomic, assign) IBOutlet UITextField *userPwd;

@end


#endif



