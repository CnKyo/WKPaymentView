//
//  WKCustomCodeView.h
//  RazerPay
//
//  Created by 王钶 on 2018/9/22.
//  Copyright © 2018年 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ///密文
    WKCustomCodeTypeSecurety,
    ///明文
    WKCustomCodeTypeDisplay,
    
} WKKeyBoradType;///显示类型

typedef enum : NSUInteger {
    ///支付样式
    WKDisPlayPayViewType,
    ///普通显示样式
    WKDisPlayNormalType,
    
} WKDisPlayViewType;///view显示类型

typedef void(^WKCustomCodeViewBlock)(NSString *mText);

@interface WKCustomCodeView : UIView<UITextFieldDelegate>

@property (copy, nonatomic)  WKCustomCodeViewBlock mTextBlock;

@property (strong, nonatomic) IBOutlet UIView *mBgkView;

@property (strong, nonatomic) IBOutlet UIView *mViewOne;

@property (strong, nonatomic) IBOutlet UIImageView *mImg1;

@property (strong, nonatomic) IBOutlet UILabel *mLb1;

@property (strong, nonatomic) IBOutlet UIView *mViewTwo;

@property (strong, nonatomic) IBOutlet UIImageView *mImg2;

@property (strong, nonatomic) IBOutlet UILabel *mLb2;

@property (strong, nonatomic) IBOutlet UIView *mViewThree;

@property (strong, nonatomic) IBOutlet UIImageView *mImg3;

@property (strong, nonatomic) IBOutlet UILabel *mLb3;

@property (strong, nonatomic) IBOutlet UIView *mViewFour;

@property (strong, nonatomic) IBOutlet UIImageView *mImg4;

@property (strong, nonatomic) IBOutlet UILabel *mLb4;

@property (strong, nonatomic) IBOutlet UIView *mViewFive;

@property (strong, nonatomic) IBOutlet UIImageView *mImg5;

@property (strong, nonatomic) IBOutlet UILabel *mLb5;

@property (strong, nonatomic) IBOutlet UIView *mViewSix;

@property (strong, nonatomic) IBOutlet UIImageView *mImg6;

@property (strong, nonatomic) IBOutlet UILabel *mLb6;

@property (strong, nonatomic) IBOutlet UIImageView *mPoint1;

@property (strong, nonatomic) IBOutlet UIImageView *mPoint2;

@property (strong, nonatomic) IBOutlet UIImageView *mPoint3;

@property (strong, nonatomic) IBOutlet UIImageView *mPoint4;

@property (strong, nonatomic) IBOutlet UIImageView *mPoint5;

@property (strong, nonatomic) IBOutlet UIImageView *mPoint6;

///键盘类型
@property (assign,nonatomic) WKKeyBoradType mType;
///view显示类型
@property (assign,nonatomic) WKDisPlayViewType mDisPlayType;

@property (strong, nonatomic) IBOutlet UITextField *mTextFiled;

/**
 初始化普通view显示类型

 @param mType 明文还是密文显示
 @return 返回view
 */
+ (WKCustomCodeView *)shareViewWithType:(WKKeyBoradType)mType;

/**
 初始化支付弹框view显示类型
 
 @param mType 明文还是密文显示
 @return 返回view
 */
+ (WKCustomCodeView *)sharePayViewWithType:(WKKeyBoradType)mType;

/**
 立即显示键盘
 */
- (void)WKShowKeyborad;

/**
 隐藏键盘
 */
- (void)WKHideKeyborad;

/**
 清空输入内容
 */
- (void)WKClearnText;

@end
