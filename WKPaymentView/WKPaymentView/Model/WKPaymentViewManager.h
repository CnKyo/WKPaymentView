//
//  WKPaymentViewManager.h
//  WKPaymentView
//
//  Created by apple on 22/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKPaymentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKPaymentViewManager : NSObject


@property (strong,nonatomic) WKPaymentView *mPayView;

/**
 单例方法

 @return 返回对象
 */
+ (instancetype)shareInstance;

/**
 对应的移除方法(会将整个view移除,移除后需再次加载)
 */
- (void)WKRemovePaymentView;
/**
 隐藏支付view(只是hidden并非移除)
 */
- (void)WKHiddenPaymentView:(BOOL)mHidden;

/**
 实例化支付详情方法(支付详情(包含商家信息等3项基本信息))

 @param model 传入的模型数据(支付数据模型(包含支付金额、优惠卷信息、商家信息、支付方式等))
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowPaymentDetail:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle;

/**
 支付详情(没有商家信息,只有2项基本信息)

 @param model 支付数据模型(包含支付金额、优惠卷信息、商家信息、支付方式等)
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowPaymentTwoDetail:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle;

/**
 选择支付方式(包含余额、银行卡、OnlineBank)

 @param model 支付数据模型(包含支付方式数据源与OnlineBank数据源)
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowPaymentMethod:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle;

/**
 输入支付密码方法

 @param model 输入支付密码数据模型
 @param vc 显示的controller
 @param handle 返回的回调方法
 @param PINHandle 返回的密码回调方法
 */
- (void)WKShowPaymentPIN:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle andPinHandle:(void(^)(NSString *mPIN))PINHandle;

/**
  加载支付动画方法

 @param mType 动画类型(
 ALLoadingViewResultTypeLoading = 0,
 ALLoadingViewResultTypeSuccess = 1,
 ALLoadingViewResultTypeError = 2,
 ALLoadingViewResultTypeExclamationMark = 3,)
 @param message 提示语
 @param model 输入支付密码数据模型
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowPaymentLoading:(ALLoadingViewResultType)mType andMessage:(NSString *)message andModel:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle;

/**
 显示汇款类型/跨境支付类型

 @param model 支付数据模型
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowCrosBorder:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle;



/**
 设置支付密码方法

 @param model 设置支付密码数据模型
 @param vc 显示的controller
 @param handle 返回的回调方法
 @param PINHandle 返回的密码回调方法
 */
- (void)WKShowSetPINCode:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle andPinHandle:(void(^)(NSString *mPIN))PINHandle;

@end

NS_ASSUME_NONNULL_END
