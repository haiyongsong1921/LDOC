//
//  UserInfoViewController.m
//  LDOC
//
//  Created by haiMac on 15/5/26.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoViewController.h"

#define GET_USER_INFO 1

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
 //   int width = self.view.frame.size.width;
 //   int height = self.view.frame.size.height;
    //1.load labels
    UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 85, 80, 30)];
    nameLabel.text = @"姓名：";
    nameLabel.font = [UIFont fontWithName:@"Arial" size:20];
    
    UILabel* pwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 155, 80, 30)];
    pwdLabel.text = @"密码：";
    pwdLabel.font = [UIFont fontWithName:@"Arial" size:20];
    
    UILabel* phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 225, 80, 30)];
    phoneLabel.text = @"电话：";
    phoneLabel.font = [UIFont fontWithName:@"Arial" size:20];
    
    UILabel* sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 295, 80, 30)];
    sexLabel.text = @"性别：";
    sexLabel.font = [UIFont fontWithName:@"Arial" size:20];
    
    UILabel* ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 365, 80, 30)];
    ageLabel.text = @"年龄：";
    ageLabel.font = [UIFont fontWithName:@"Arial" size:20];
    
    [self.view addSubview:nameLabel];
    [self.view addSubview:pwdLabel];
    [self.view addSubview:phoneLabel];
    [self.view addSubview:sexLabel];
    [self.view addSubview:ageLabel];
    
    
    //2.textfield
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(120, 80, 180, 40)];
    _userName.backgroundColor = [UIColor whiteColor];
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.textColor = [UIColor blackColor];
    _userName.userInteractionEnabled = NO;
    
    _userPwd = [[UITextField alloc] initWithFrame:CGRectMake(120, 150, 180, 40)];
    _userPwd.backgroundColor = [UIColor whiteColor];
    _userPwd.borderStyle = UITextBorderStyleRoundedRect;
    _userPwd.textColor = [UIColor blackColor];
    _userPwd.userInteractionEnabled = NO;
    
    _userPhone = [[UITextField alloc] initWithFrame:CGRectMake(120, 220, 180, 40)];
    _userPhone.backgroundColor = [UIColor whiteColor];
    _userPhone.borderStyle = UITextBorderStyleRoundedRect;
    _userPhone.textColor = [UIColor blackColor];
    _userPhone.userInteractionEnabled = NO;
    
    _userSex = [[UITextField alloc] initWithFrame:CGRectMake(120, 290, 180, 40)];
    _userSex.backgroundColor = [UIColor whiteColor];
    _userSex.borderStyle = UITextBorderStyleRoundedRect;
    _userSex.textColor = [UIColor blackColor];
    _userSex.userInteractionEnabled = NO;
    
    _userAge = [[UITextField alloc] initWithFrame:CGRectMake(120, 360, 180, 40)];
    _userAge.backgroundColor = [UIColor whiteColor];
    _userAge.borderStyle = UITextBorderStyleRoundedRect;
    _userAge.textColor = [UIColor blackColor];
    _userAge.userInteractionEnabled = NO;
    
    [self.view addSubview:_userName];
    [self.view addSubview:_userPwd];
    [self.view addSubview:_userPhone];
    [self.view addSubview:_userSex];
    [self.view addSubview:_userAge];
                     
    //3.load button
    //_btnGetUserInfo = [[UIButton alloc] initWithFrame:CGRectMake(120, 420, 80, 40)];
    _btnGetUserInfo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnGetUserInfo.frame = CGRectMake(100, 420, 120, 40);
    [_btnGetUserInfo setBackgroundColor:[UIColor lightGrayColor]];

    [_btnGetUserInfo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnGetUserInfo setTitle:@"获取用户信息" forState:UIControlStateNormal];
    [_btnGetUserInfo addTarget:self action:@selector(btnGetInfoClicked:) forControlEvents:UIControlEventTouchUpInside];
 //   _btnGetUserInfo.font = [UIFont fontWithName:@"获取用户信息" size:15];
    [self.view addSubview:_btnGetUserInfo];


    // release
    [nameLabel release];
    [pwdLabel release];
    [phoneLabel release];
    [sexLabel release];
    [ageLabel release];
    
}

-(void)initNetworkCommunication{
    /*
     int testEndian = 0x1234;
     int sizeOfInt = sizeof(int*);// test for big endian
     NSLog(@"%i", sizeOfInt);
     char* pEndian = &testEndian;
     */
    int err;
    int fd=socket(AF_INET, SOCK_STREAM  , 0);
    BOOL success=(fd!=-1);
    struct sockaddr_in addr;
    

    if (success) {
        //============================================================================
        struct sockaddr_in peeraddr;
        memset(&peeraddr, 0, sizeof(peeraddr));
        peeraddr.sin_len=sizeof(peeraddr);
        peeraddr.sin_family=AF_INET;
        peeraddr.sin_port=htons(6000);
        //            peeraddr.sin_addr.s_addr=INADDR_ANY;
        peeraddr.sin_addr.s_addr=inet_addr("192.168.1.9");
        //            这个地址是服务器的地址，
        socklen_t addrLen;
        addrLen =sizeof(peeraddr);
        NSLog(@"connecting");
        err=connect(fd, (struct sockaddr *)&peeraddr, addrLen);
        success=(err==0);
        if (success) {
            //                struct sockaddr_in addr;
            err =getsockname(fd, (struct sockaddr *)&addr, &addrLen);
            success=(err==0);
            //============================================================================
            //============================================================================
            if (success) {
                NSLog(@"connect success,local address:%s,port:%d",inet_ntoa(addr.sin_addr),ntohs(addr.sin_port));
                char cSend[300];
                int nSendSize = 12;
                memset((char*)cSend, 0, sizeof(cSend));
                
                *((int*)cSend) = 4001;
                *((int*)(cSend + 4)) = nSendSize;
                *((int*)(cSend + 8)) = GET_USER_INFO;
                printf("%s", cSend);
                
                int nSizeSend = send(fd, cSend, nSendSize, 0);
                
                char cRecv[12000];
                //              int nRecv = sizeof(cRecv);
                memset((char*)cRecv, 0, sizeof(cRecv));
                int nRecv = recv(fd, cRecv, sizeof(cRecv), 0);
                char* pRecv = cRecv;
                [self CreateUserInfoList:pRecv];
                
            }
        }
        else{
            NSLog(@"connect failed");
        }
    }
    
}

-(void)CreateUserInfoList :(char*) pRecv
{
    pRecv += 12;
    int nContinueFlag = *((int*)(pRecv));
    pRecv += sizeof(int);
    int numberOfUser = *((int*)(pRecv));
    pRecv += sizeof(int);
    
    int size = 0;
    struct _userInfo tempUserInfo;
    
    tempUserInfo.uID = *((int*)(pRecv + size));
    size += sizeof(tempUserInfo.uID);
    
    memcpy((char*)tempUserInfo.uName, (char*)(pRecv + size), sizeof(tempUserInfo.uName));
    size += sizeof(tempUserInfo.uName);
    
    memcpy((char*)tempUserInfo.uPhone, (char*)(pRecv + size), sizeof(tempUserInfo.uPhone));
    size += sizeof(tempUserInfo.uPhone);
    
    memcpy((char*)tempUserInfo.uPasswd, (char*)(pRecv + size), sizeof(tempUserInfo.uPasswd));
    size += sizeof(tempUserInfo.uPasswd);
    
    memcpy((char*)tempUserInfo.uSex, (char*)(pRecv + size), sizeof(tempUserInfo.uSex));
    size += sizeof(tempUserInfo.uSex);
    
    tempUserInfo.uAge = *((int*)(pRecv + size));
    size += sizeof(tempUserInfo.uAge);
    NSString *sUserName = [NSString stringWithCString:tempUserInfo.uName encoding:NSUTF8StringEncoding];
    NSString *sUserPhone = [NSString stringWithCString:tempUserInfo.uPhone encoding:NSUTF8StringEncoding];
    NSString *sUserPasswd = [NSString stringWithCString:tempUserInfo.uPasswd encoding:NSUTF8StringEncoding];
    NSString *sUserSex = [NSString stringWithCString:tempUserInfo.uSex encoding:NSUTF8StringEncoding];
    NSString *sUserAge = [NSString stringWithFormat:@"%d",tempUserInfo.uAge];
    
    _userName.text = sUserName;
    _userPhone.text = sUserPhone;
    _userPwd.text = sUserPasswd;
    _userSex.text = sUserSex;
    _userAge.text = sUserAge;
    
}

- (IBAction)btnGetInfoClicked:(id)sender {
    [self initNetworkCommunication];
    
}
@end
