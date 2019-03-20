//
//  WKModel.h
//  RazerPay
//
//  Created by Macmini on 2018/6/8.
//  Copyright © 2018年 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ALLoadingViewResultTypeLoading = 0,
    ALLoadingViewResultTypeSuccess = 1,
    ALLoadingViewResultTypeError = 2,
    ALLoadingViewResultTypeExclamationMark = 3,
} ALLoadingViewResultType;

@interface ALLoadingView : UIView

@property(nonatomic, strong) UIColor *loadingColor;
@property(nonatomic, strong) UIColor *successColor;
@property(nonatomic, strong) UIColor *exclamationColor;
@property(nonatomic, strong) UIColor *errorColor;

@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic, assign) CGFloat radius;

- (void) start;
- (void)endAnimationWithResult:(ALLoadingViewResultType )result;
@end
