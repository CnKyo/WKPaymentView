//
//  WKPaymentView.h
//  WKPaymentView
//
//  Created by 王钶 on 13/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    WKPayTableViewDisPlayLeft,
    WKPayTableViewDisPlayMid,
    WKPayTableViewDisPlayRight,
} WKPayTableViewDisPlayType;


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
 @param mType 代表是哪个支付步骤下的事件(
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
typedef void(^WKPaymentDetailViewClick)(WKPaymentBtnModel mTag,WKPaymentType mType);

/**
 选择支付方式方法
 
 @param mTag 按钮类型
 @param mCurrentMethod 返回选择的支付方式信息
 */
typedef void(^WKPaymentMethodViewClick)(WKPaymentBtnModel mTag,WKPaymentMethodModel *mCurrentMethod);

/**
 输入支付密码的代理方法
 
 @param mPINCode 返回输入的密码
 */
typedef void(^WKPaymentViewPINCodeBlock)(NSString *mPINCode);

@interface WKPaymentView : UIView
#pragma mark----****----回调方法⬇️
@property (copy,nonatomic) WKPaymentDetailViewClick WKPayDetailViewHandle;

@property (copy,nonatomic) WKPaymentMethodViewClick WKPayMethodViewHandle;

@property (copy,nonatomic) WKPaymentViewPINCodeBlock WKPayPINCodeViewHandle;

#pragma mark----****----回调方法⬆️

/**
 数据源
 */
@property (nonatomic,strong) NSMutableArray *mDataSource;

@property (nonatomic, strong) UIView *mNavMaskView;

@property (weak, nonatomic) IBOutlet UIView *mMaskView;

/**
 最左边的tableview
 */
@property (weak, nonatomic) IBOutlet UIView *mLeftTableView;

/**
 中间的tableView
 */
@property (weak, nonatomic) IBOutlet UIView *mMidTableView;

/**
 最右边的tableView
 */
@property (weak, nonatomic) IBOutlet UIView *mRightTableView;

@property (assign,nonatomic) WKPaymentType mPayViewType;

@property (assign,nonatomic) WKPayTableViewDisPlayType mDisPalyPayViewType;

/**
 初始化方法

 @return 返回view
 */
+ (WKPaymentView *)initView;

/**
 显示方法

 @param VC 显示到当前ViewController
 */
- (void)WKShowPaymentViewInVC:(UIViewController *)VC;

/**
 隐藏支付view(只是hidden并非移除)
 */
- (void)WKHiddenPaymentView:(BOOL)mHidden;

/**
 移除支付view
 */
- (void)WKRemovePaymentView;

- (void)loadDetail;

- (void)loadMethod;


#pragma mark----****----视图移动动画
/**
 左边移动到中间
 */
- (void)WKLeftToMid;
/**
 中间移动到右边
 */
- (void)WKMidToRight;
/**
 左边往右边移动
 */
- (void)WKLeftToRight;
/**
 右边往左边移动
 */
- (void)WKRightToLeft;
/**
 右边移动到中间
 */
- (void)WKRightToMid;
/**
 中间移动到左边
 */
- (void)WKMidToLeft;

#pragma mark----****----传递方法

/**
 支付详情(包含商家信息等3项基本信息)

 @param model 支付数据模型(包含支付金额、优惠卷信息、商家信息、支付方式等)
 */
- (void)WKShowPaymentDetail:(WKPaymentModel *)model;

/**
 支付详情(没有商家信息,只有2项基本信息)

 @param model 支付数据模型(包含支付金额、优惠卷信息、商家信息、支付方式等)
 */
- (void)WKShowPaymentTwoDetail:(WKPaymentModel *)model;

/**
 选择支付方式(包含余额、银行卡、OnlineBank)

 @param model 支付数据模型(包含支付方式数据源与OnlineBank数据源)
 */
- (void)WKShowPaymentMethod:(WKPaymentModel *)model;

/**
 输入支付密码方法

 @param model 输入支付密码数据模型
 */
- (void)WKShowPaymentPIN:(WKPaymentModel *)model;

/**
 加载支付动画方法

 @param mType 动画类型(
 ALLoadingViewResultTypeLoading = 0,
 ALLoadingViewResultTypeSuccess = 1,
 ALLoadingViewResultTypeError = 2,
 ALLoadingViewResultTypeExclamationMark = 3,)
 @param message 提示语
 */
- (void)WKShowPaymentLoading:(ALLoadingViewResultType)mType andMessage:(NSString *)message;

/**
 显示汇款类型/跨境支付类型

 @param model 支付数据模型
 */
- (void)WKShowCrosBorder:(WKPaymentModel *)model;
#pragma mark----****----设置支付密码

/**
 设置支付密码方法

 @param model 设置支付密码数据模型
 */
- (void)WKShowSetPINCode:(WKPaymentModel *)model;
@end

NS_ASSUME_NONNULL_END
