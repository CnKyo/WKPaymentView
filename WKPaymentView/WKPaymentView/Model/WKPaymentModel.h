//
//  WKPaymentModel.h
//  WKPaymentView
//
//  Created by apple on 16/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface WKPaymentModel : NSObject <NSSecureCoding>

/**
 顶部标题(所有界面顶部标题内容)
 */
@property (strong,nonatomic) NSString *mTitle;

/**
 左边的返回图片
 */
@property (strong,nonatomic) NSString *mLeftImage;

/**
 去支付按钮背景颜色(默认为主题色)
 */
@property (strong,nonatomic) UIColor *mGoPayBgkColor;

/**
 显示的金额
 */
@property (strong,nonatomic) NSString *mAmount;
/**
 分类标题
 */
@property (strong,nonatomic) NSString *mCategoryLb;

/**
 分类
 */
@property (strong,nonatomic) NSString *mCategory;
/**
 商家标题
 */
@property (strong,nonatomic) NSString *mMerchantLb;
/**
 商家标题
 */
@property (strong,nonatomic) NSString *mMerchant;
/**
 支付方式标题
 */
@property (strong,nonatomic) NSString *mMethodLb;
/**
 支付方式标题
 */
@property (strong,nonatomic) NSString *mMethod;
/**
 优惠卷标题
 */
@property (strong,nonatomic) NSString *mCouponLb;
/**
 优惠卷标题
 */
@property (strong,nonatomic) NSString *mCoupon;
#pragma mark----****----跨境支付/汇款汇率相关信息
/**
 汇率标题
 */
@property (strong,nonatomic) NSString *mRateChangeLb;
/**
 汇率标题
 */
@property (strong,nonatomic) NSString *mRateChange;

#pragma mark----****----忘记支付密码相关标题
/**
 忘记支付密码相关标题
 */
@property (strong,nonatomic) NSString *mForgetPINTitle;

#pragma mark----****----设置支付密码相关标题
/**
 设置支付密码相关标题
 */
@property (strong,nonatomic) NSString *mSetPINSubTitle;
/**
 设置支付密码相关副标题
 */
@property (strong,nonatomic) NSString *mSetPINDetail;

/**
 类型
 */
@property (assign,nonatomic) NSInteger mType;

@end

@interface WKPaymentMethodModel : NSObject

@property (strong,nonatomic) NSString *mTitle;
@property (assign,nonatomic) BOOL selected;

@property (assign,nonatomic) NSInteger mType;

@end

NS_ASSUME_NONNULL_END
