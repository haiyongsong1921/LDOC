//
//  UIScrollView+UIScrollView_UITouch.m
//  LDOC
//
//  Created by haiMac on 15/5/19.
//  Copyright (c) 2015年 haiPro. All rights reserved.
//

#import "UIScrollView+UIScrollView_UITouch.h"

@implementation UIScrollView (UIScrollView_UITouch)

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    
    int widthSize = self.frame.size.width;
    
    int page = self.contentOffset.x / self.frame.size.width;
    switch (page) {
        case 0:
        {
                
        }
            break;
        case 1:
        {
        
        }
            break;
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }

   
    [super touchesEnded:touches withEvent:event];
}

@end
