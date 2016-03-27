//
//  ViewController.m
//  LDOC
//
//  Created by haiPro on 15/4/30.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import "ViewController.h"
#define GET_USER_INFO 1

#define PORT 6000
@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//导航栏设置
	UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(login:)];
	self.navigationItem.rightBarButtonItem = rightBarButton;
	
	UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"定位" style:UIBarButtonItemStylePlain target:self action:@selector(locate:)];
	self.navigationItem.leftBarButtonItem = leftBarButton;
	
	
	self.navigationItem.title=@"主题餐厅";
	

	//scrolview arrage
    self.arrayImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"ads1_300*160.png"],[UIImage imageNamed:@"ads2_300*160.png"],[UIImage imageNamed:@"ads3_300*160.png"], nil];
    
    CGFloat width = 300;
    CGFloat height = 160;
    
    _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 60, width, height)];
    [_myScrollView setPagingEnabled:YES];
    _myScrollView.showsHorizontalScrollIndicator = NO;
    _myScrollView.showsVerticalScrollIndicator = NO;
    [_myScrollView setDelegate:self];
    [_myScrollView setBackgroundColor:[UIColor lightGrayColor]];
    [_myScrollView setContentSize:CGSizeMake(300 * _arrayImages.count, 0)];
    [self.view addSubview:_myScrollView];
    
    

    
    for(int j=0; j<_arrayImages.count; ++j)
    {
        UIImageView* pImageView = [[UIImageView alloc] initWithImage:[_arrayImages objectAtIndex:j]];
        pImageView.frame = CGRectMake(j*width, -60, width, height);
        [_myScrollView addSubview:pImageView];
    }
    
   
    
    _myPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, 200 , 300, 20)];
    [_myPageControl setBackgroundColor:[UIColor clearColor]];
    _myPageControl.currentPage = 0;
    _myPageControl.numberOfPages = _arrayImages.count;
    [_myPageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_myPageControl];
    
   /* for(int i=0; i<_arrayImages.count; ++i)
    {
        [self loadScrollViewPage:i];
    }*/
	
    //addbutton 4
    UIButton *add4Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add4Button.frame = CGRectMake(10, 230, 145, 150);
    [add4Button setBackgroundImageByName:@"add4_145*150.png"];
    
    [self.view addSubview:add4Button];
    
    [add4Button setTitle:@"" forState:UIControlStateHighlighted];
    // add targets and actions
    [add4Button addTarget:self action:@selector(add4ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //addbutton 5
    UIButton *add5Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add5Button.frame = CGRectMake(165, 230, 145, 70);
    [add5Button setBackgroundImageByName:@"adds5_145*70.png"];
    
    [self.view addSubview:add5Button];
    
    [add5Button setTitle:@"" forState:UIControlStateHighlighted];
    // add targets and actions
    [add5Button addTarget:self action:@selector(add5ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //addbutton 6
    UIButton *add6Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add6Button.frame = CGRectMake(165, 310, 145, 70);
    [add6Button setBackgroundImageByName:@"add6_145*70.png"];
    
    [self.view addSubview:add6Button];
    
    [add6Button setTitle:@"" forState:UIControlStateHighlighted];
    // add targets and actions
    [add6Button addTarget:self action:@selector(add6ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //addbutton 7
    UIButton *add7Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add7Button.frame = CGRectMake(10, 390, 70, 70);
    [add7Button setBackgroundImageByName:@"button1_70*70.png"];
    
    [self.view addSubview:add7Button];
    
    [add7Button setTitle:@"" forState:UIControlStateHighlighted];
    // add targets and actions
    [add7Button addTarget:self action:@selector(Button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //addbutton 8
    UIButton *add8Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add8Button.frame = CGRectMake(85, 390, 170, 70);
    [add8Button setBackgroundImageByName:@"button2_70*70.png"];
    
    [self.view addSubview:add8Button];
    
    [add8Button setTitle:@"" forState:UIControlStateHighlighted];
    // add targets and actions
    [add8Button addTarget:self action:@selector(Button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //addbutton 9
    UIButton *add9Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add9Button.frame = CGRectMake(165, 390, 70, 70);
    [add9Button setBackgroundImageByName:@"button4_70.jpg"];
    
    [self.view addSubview:add9Button];
    
    [add9Button setTitle:@"" forState:UIControlStateHighlighted];
    // add targets and actions
    [add9Button addTarget:self action:@selector(Button3Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //addbutton 10
    UIButton *add10Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add10Button.frame = CGRectMake(240, 390, 70, 70);
    [add10Button setBackgroundImageByName:@"button5.png"];
    
    [self.view addSubview:add10Button];
    
    [add10Button setTitle:@"" forState:UIControlStateHighlighted];
    // add targets and actions
    [add10Button addTarget:self action:@selector(Button4Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

// login
-(IBAction)login:(id)sender
{
	LoginViewController* pLoginView = [[LoginViewController alloc] init];
	[self.navigationController pushViewController:pLoginView animated:YES];
}
// locate
-(IBAction)locate:(id)sender
{
	int sdfs = 23;
}

-(IBAction)add4ButtonClicked:(id)sender
{
    UserInfoViewController* pUserInfoView = [[UserInfoViewController alloc] init];
    [self.navigationController pushViewController:pUserInfoView animated:YES];
}

-(IBAction)add5ButtonClicked:(id)sender
{
    
}

-(IBAction)add6ButtonClicked:(id)sender
{
    
}

-(IBAction)Button1Clicked:(id)sender
{
    
}

-(IBAction)Button2Clicked:(id)sender
{
    
}

-(IBAction)Button3Clicked:(id)sender
{
    
}

-(IBAction)Button4Clicked:(id)sender
{
    
}

-(void)loadScrollViewPage:(NSInteger)page
{
    if(page >= self.arrayImages.count)
    {
        return ;
    }
}

- (IBAction)changePage:(id)sender
{
  //  NSInteger page = self.myPageControl.currentPage;
//	int nPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
-(void)initNetworkCommunication{

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
        peeraddr.sin_addr.s_addr=inet_addr("192.168.1.10");
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

*/

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = _myScrollView.contentOffset.x / _myScrollView.frame.size.width;
    _myPageControl.currentPage = page;
}

@end
