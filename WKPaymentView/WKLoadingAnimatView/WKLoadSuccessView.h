//
//  WKLoadSuccessView.h
//  RazerPay
//
//  Created by Macmini on 2018/6/8.
//  Copyright © 2018年 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKLoadSuccessView : UIView<CAAnimationDelegate>

-(void)start;

-(void)hide;

+(WKLoadSuccessView*)showIn:(UIView*)view;

+(WKLoadSuccessView*)hideIn:(UIView*)view;

@end
