//
//  LoginViewController.m
//  LDOC
//
//  Created by haiMac on 15/6/4.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "UserInfo.h"

@interface LoginViewController ()


@end

@implementation LoginViewController

-(void)viewDidLoad{
    UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 125, 80, 30)];
    nameLabel.text = @"手机号：";
    nameLabel.font = [UIFont fontWithName:@"Arial" size:20];
    
    UILabel* pwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 195, 80, 30)];
    pwdLabel.text = @"密码：";
    pwdLabel.font = [UIFont fontWithName:@"Arial" size:20];
    
    [self.view addSubview:nameLabel];
    [self.view addSubview:pwdLabel];
    
    [nameLabel release];
    [pwdLabel release];
    
    
    //2.textfield
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(120, 120, 180, 40)];
    _userName.backgroundColor = [UIColor whiteColor];
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.textColor = [UIColor blackColor];

    
    _userPwd = [[UITextField alloc] initWithFrame:CGRectMake(120, 190, 180, 40)];
    _userPwd.backgroundColor = [UIColor whiteColor];
    _userPwd.borderStyle = UITextBorderStyleRoundedRect;
    _userPwd.textColor = [UIColor blackColor];
    _userPwd.secureTextEntry = YES;
//    _userPwd.userInteractionEnabled = NO;
    
    [self.view addSubview:_userName];
    [self.view addSubview:_userPwd];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(40, 280, 80, 30);
    [registerButton setBackgroundColor:[UIColor clearColor]];
    
    [registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerButton setTitle:@"立即注册" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(btnRegister:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *forgotPwdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    forgotPwdButton.frame = CGRectMake(200, 280, 80, 30);
    [forgotPwdButton setBackgroundColor:[UIColor clearColor]];
    
    [forgotPwdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgotPwdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgotPwdButton addTarget:self action:@selector(btnForgetPwd:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame = CGRectMake(40, 350, 240, 30);
    [loginButton setBackgroundColor:[UIColor cyanColor]];
    
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginButton setTitle:@"登  陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(btnLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:registerButton];
    [self.view addSubview:forgotPwdButton];
    [self.view addSubview:loginButton];
    

}

-(IBAction)btnLogin:(id)sender
{
    NSString* strName = _userName.text;
    NSString* strPwd = _userPwd.text;
 //   int uNameLen = strName.length;
    struct _userInfo tempUserInfo;
    const char* uName = [strName cStringUsingEncoding:NSASCIIStringEncoding];
    const char* uPwd = [strPwd cStringUsingEncoding:NSASCIIStringEncoding];
 //   memcpy(tempUserInfo.uName, uName, strName.length);
    strcpy(tempUserInfo.uName, uName);
    strcpy(tempUserInfo.uPasswd, uPwd);
    
}

-(IBAction)btnRegister:(id)sender
{
    
}

-(IBAction)btnForgetPwd:(id)sender
{
  
    
}

-(void)dealloc
{
    [_userName release];
    [_userPwd release];
    [super dealloc];
}


@end