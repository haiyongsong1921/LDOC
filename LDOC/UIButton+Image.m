//
//  UIButton+Image.m
//  LDOC
//
//  Created by haiMac on 15/5/22.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import "UIButton+Image.h"

@implementation UIButton (Image)

- (void)setBackgroundImage:(UIImage*)image
{
    CGRect rect;
    rect = self.frame;
    rect.size = image.size; // set button size as image size
    self.frame = rect;
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)setBackgroundImageByName:(NSString*)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName]];
}

@end
