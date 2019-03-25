//
//  WKPaymentViewManager.m
//  WKPaymentView
//
//  Created by 王钶 on 22/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import "WKPaymentViewManager.h"

static WKPaymentViewManager *mPayManager = nil;


@implementation WKPaymentViewManager
+ (instancetype)shareInstance{
    if (!mPayManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            mPayManager = [[WKPaymentViewManager alloc] init];
        });
    }
    return mPayManager;
}
- (id)init{
    self = [super init];
    if (self) {
        self.mPayView = [WKPaymentView initView];
    }
    return self;
}
- (void)WKRemovePaymentView{
    [mPayManager.mPayView WKRemovePaymentView];
}
/**
 隐藏支付view(只是hidden并非移除)
 */
- (void)WKHiddenPaymentView:(BOOL)mHidden{
    [mPayManager.mPayView WKHiddenPaymentView:mHidden];
}
/**
 实例化支付详情方法
 
 @param model 传入的模型数据
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowPaymentDetail:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle{
    [mPayManager.mPayView WKShowPaymentViewInVC:vc];
    [mPayManager.mPayView WKShowPaymentDetail:model];
    mPayManager.mPayView.WKPayDetailViewHandle = ^(WKPaymentBtnModel mTag, WKPaymentType mType) {
        handle(mTag,mType);
    };
    
}
/**
 支付详情(没有商家信息,只有2项基本信息)
 
 @param model 支付数据模型(包含支付金额、优惠卷信息、商家信息、支付方式等)
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowPaymentTwoDetail:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle{
    [mPayManager.mPayView WKShowPaymentViewInVC:vc];
    [mPayManager.mPayView WKShowPaymentTwoDetail:model];
    mPayManager.mPayView.WKPayDetailViewHandle = ^(WKPaymentBtnModel mTag, WKPaymentType mType) {
        handle(mTag,mType);
    };
}

/**
 选择支付方式(包含余额、银行卡、OnlineBank)
 
 @param model 支付数据模型(包含支付方式数据源与OnlineBank数据源)
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowPaymentMethod:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle{
    [mPayManager.mPayView WKShowPaymentViewInVC:vc];
    [mPayManager.mPayView WKShowPaymentMethod:model];
    mPayManager.mPayView.WKPayDetailViewHandle = ^(WKPaymentBtnModel mTag, WKPaymentType mType) {
        handle(mTag,mType);
    };
}

/**
 输入支付密码方法
 
 @param model 输入支付密码数据模型
 @param vc 显示的controller
 @param handle 返回的回调方法
 @param PINHandle 返回的密码回调方法
 */
- (void)WKShowPaymentPIN:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle andPinHandle:(void(^)(NSString *mPIN))PINHandle{
    [mPayManager.mPayView WKShowPaymentViewInVC:vc];
    [mPayManager.mPayView WKShowPaymentPIN:model];
    mPayManager.mPayView.WKPayDetailViewHandle = ^(WKPaymentBtnModel mTag, WKPaymentType mType) {
        handle(mTag,mType);
    };
    mPayManager.mPayView.WKPayPINCodeViewHandle = ^(NSString * _Nonnull mPINCode) {
        PINHandle(mPINCode);
    };
}
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
- (void)WKShowPaymentLoading:(ALLoadingViewResultType)mType andMessage:(NSString *)message andModel:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle{
    [mPayManager.mPayView WKShowPaymentViewInVC:vc];
    [mPayManager.mPayView WKShowPaymentLoading:mType andMessage:message];
    mPayManager.mPayView.WKPayDetailViewHandle = ^(WKPaymentBtnModel mTag, WKPaymentType mType) {
        handle(mTag,mType);
    };
}
/**
 显示汇款类型/跨境支付类型
 
 @param model 支付数据模型
 @param vc 显示的controller
 @param handle 返回的回调方法
 */
- (void)WKShowCrosBorder:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle{
    [mPayManager.mPayView WKShowPaymentViewInVC:vc];
    [mPayManager.mPayView WKShowCrosBorder:model];
    mPayManager.mPayView.WKPayDetailViewHandle = ^(WKPaymentBtnModel mTag, WKPaymentType mType) {
        handle(mTag,mType);
    };
}
/**
 设置支付密码方法
 
 @param model 设置支付密码数据模型
 @param vc 显示的controller
 @param handle 返回的回调方法
 @param PINHandle 返回的密码回调方法
 */
- (void)WKShowSetPINCode:(WKPaymentModel *)model addViewController:(UIViewController *)vc andHandle:(void(^)(WKPaymentBtnModel mTag,WKPaymentType mType))handle andPinHandle:(void(^)(NSString *mPIN))PINHandle{
    [mPayManager.mPayView WKShowPaymentViewInVC:vc];
    [mPayManager.mPayView WKShowSetPINCode:model];
    mPayManager.mPayView.WKPayDetailViewHandle = ^(WKPaymentBtnModel mTag, WKPaymentType mType) {
        handle(mTag,mType);
    };
    mPayManager.mPayView.WKPayPINCodeViewHandle = ^(NSString * _Nonnull mPINCode) {
        PINHandle(mPINCode);
    };
}
@end
