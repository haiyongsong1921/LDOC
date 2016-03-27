//
//  ViewController.h
//  LDOC
//
//  Created by haiPro on 15/4/30.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#import "UIScrollView+UIScrollView_UITouch.h"
#import "UIButton+Image.h"
#import "UserInfoViewController.h"
#import "LoginViewController.h"
//#import "vector"
//using namespace std;



@interface ViewController : UIViewController<NSStreamDelegate, UIScrollViewDelegate>

/*
@property (nonatomic, assign) IBOutlet UIButton *_btnGetUserInfo;
@property (nonatomic, assign) IBOutlet UITextField *_userName;
@property (nonatomic, assign) IBOutlet UITextField *_userPwd;
@property (nonatomic, assign) IBOutlet UITextField *_userPhone;
@property (nonatomic, assign) IBOutlet UITextField *_userSex;
@property (nonatomic, assign) IBOutlet UITextField *_userAge;

@property (nonatomic, retain) NSInputStream* _inputStream;
@property (nonatomic, retain) NSOutputStream* _outputStream;

@property(nonatomic) struct _userInfo*  _pUserInfo;

*/
@property (retain, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (retain, nonatomic) IBOutlet UIPageControl *myPageControl;
@property(nonatomic, strong)NSArray  *arrayImages;          //存放图片的数组
@property(nonatomic, strong)NSMutableArray *viewController; //存放UIViewController的可变数组
@property(nonatomic, assign) IBOutlet UIButton* btnAds4;
@property(nonatomic, assign) IBOutlet UIButton* btnAds5;
@property(nonatomic, assign) IBOutlet UIButton* btnAds6;
@property(nonatomic, assign) IBOutlet UIButton* btnAds7;
@property(nonatomic, assign) IBOutlet UIButton* btnAds8;
@property(nonatomic, assign) IBOutlet UIButton* btnAds9;
@property(nonatomic, assign) IBOutlet UIButton* btnAds10;

//@property(nonatomic, nonatomic) NSArray _userInfo*  _pUserInfo;


- (IBAction)changePage:(id)sender;


-(IBAction)add4ButtonClicked:(id)sender;
-(IBAction)add5ButtonClicked:(id)sender;
-(IBAction)add6ButtonClicked:(id)sender;
-(IBAction)Button1Clicked:(id)sender;
-(IBAction)Button2Clicked:(id)sender;
-(IBAction)Button3Clicked:(id)sender;
-(IBAction)Button4Clicked:(id)sender;
-(IBAction)login:(id)sender;
-(IBAction)locate:(id)sender;

@end

