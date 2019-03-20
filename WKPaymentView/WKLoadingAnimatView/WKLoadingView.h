//
//  WKLoadingView.h
//  RazerPay
//
//  Created by Macmini on 2018/6/8.
//  Copyright © 2018年 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKLoadingView : UIView

-(void)start;

-(void)hide;

+(WKLoadingView*)showIn:(UIView*)view;

+(WKLoadingView*)hideIn:(UIView*)view;
@end
