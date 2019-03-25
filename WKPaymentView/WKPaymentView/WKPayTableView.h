//
//  WKPayTableView.h
//  WKPaymentView
//
//  Created by 王钶 on 14/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKPaymentView.h"
NS_ASSUME_NONNULL_BEGIN

@protocol WKPayTableViewDidBtnClickDelegate <NSObject>

@optional

/**
 所有界面的按钮点击方法(合并为一个方法用tag和type加以区分)->⚠️注意:此方法不会返回支付方式选择方法,因为选择支付方式需要返回选择的数据模型

 @param mTag 代表是哪个按钮触发的事件(
 ///左边的图片
 WKPaymentLeftImageModel = 0,
 ///选择支付方式
 WKPaymentSelectPayMethodModel = 1,
 ///选择优惠卷
 WKPaymentSelectCouponModel = 2,
 ///忘记支付密码
 WKPaymentForgetPINModel = 3,
 ///去支付按钮
 WKPaymentGoPayModel = 4,)
 @param type 代表是哪个支付步骤下的事件(
 ///默认类型
 WKPaymentDefault =  0,
 ///支付详情类型
 WKPaymentDetail = 1,
 ///SPG类型
 WKPaymentSPGDetail = 2,
 ///汇款类型
 WKPaymentRemiitanceDetail = 3,
 ///跨境支付类型
 WKPaymentCrossBorderDetail = 4,
 ///优惠卷类型
 WKPaymentCouponDetail = 5,
 ///支付方式类型
 WKPaymentMethod = 6,
 ///输入支付密码
 WKPaymentInputPINCode = 7,
 ///设置支付密码
 WKSetPaymentPIN = 8,
 ///确认设置支付密码
 WKComfirmSetPaymentPIN = 9,
 ///跨境支付/汇款类型
 WKCrosBorderPayment = 10,
 ///在线银行支付
 WKOnlineBankPayment = 11,
 ///支付中类型
 WKPaymenting = 12,
 )
 */
- (void)WKPayTableViewPaymentDetailDidClicked:(WKPaymentBtnModel)mTag andType:(WKPaymentType)type;

/**
 选择支付方式方法

 @param mTag 按钮类型
 @param mCurrentMethod 返回选择的支付方式信息
 */
- (void)WKPayTableViewPaymentMethodDidClicked:(WKPaymentBtnModel)mTag andSelectedMethod:(WKPaymentMethodModel *)mCurrentMethod;

/**
 输入支付密码的代理方法

 @param mPIN 返回输入的密码
 */
- (void)WKPayTableViewPaymentPINCodeHandle:(NSString *)mPIN;
@end

@interface WKPayTableView : UIView<UITableViewDelegate,UITableViewDataSource>

+ (WKPayTableView *)initView;

@property (assign,nonatomic) WKPaymentType mPayViewType;

@property (assign,nonatomic) WKPaymentModel *model;

@property (strong,nonatomic) NSString *messgae;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (strong,nonatomic) NSMutableArray *mMethods;

@property (weak,nonatomic) id<WKPayTableViewDidBtnClickDelegate> delegate;


#pragma mark----****----传递方法
- (void)WKShowPaymentDetail:(WKPaymentModel *)model;
- (void)WKShowPaymentMethod:(WKPaymentModel *)model;
- (void)WKShowPaymentPIN:(WKPaymentModel *)model;
- (void)loadPaymentMethod:(NSArray *)dataSource;

- (void)WKShowPaymentLoading:(ALLoadingViewResultType)mType andMessage:(NSString *)message;

/**
 显示汇款类型/跨境支付类型
 
 @param model 支付数据模型
 */
- (void)WKShowCrosBorder:(WKPaymentModel *)model;

#pragma mark----****----设置支付密码
- (void)WKShowSetPINCode:(WKPaymentModel *)model;
@end

NS_ASSUME_NONNULL_END
