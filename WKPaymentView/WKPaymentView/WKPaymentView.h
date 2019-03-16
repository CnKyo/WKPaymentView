//
//  WKPaymentView.h
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ///默认类型
    WKPaymentDefault,
    ///支付详情类型
    WKPaymentDetail,
    ///SPG类型
    WKPaymentSPGDetail,
    ///汇款类型
    WKPaymentRemiitanceDetail,
    ///跨境支付类型
    WKPaymentCrossBorderDetail,
    ///优惠卷类型
    WKPaymentCouponDetail,
    ///支付方式类型
    WKPaymentMethod,
    ///输入支付密码
    WKPaymentInputPINCode,
    ///设置支付密码
    WKSetPaymentPIN,
    ///支付中类型
    WKPaymenting,
} WKPaymentType;///支付类型


typedef enum : NSUInteger {
    WKPayTableViewDisPlayLeft,
    WKPayTableViewDisPlayMid,
    WKPayTableViewDisPlayRight,
} WKPayTableViewDisPlayType;


typedef void(^WKPaymentDetailViewClick)(NSInteger mTag);


@interface WKPaymentView : UIView
#pragma mark----****----回调方法⬇️
@property (copy,nonatomic) WKPaymentDetailViewClick WKPayDetailViewHandle;
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

#pragma mark----****----添加导航条蒙层view
- (void)WKAddNavMaskView;
#pragma mark----****----移除导航条蒙层view
- (void)WKRemoveNavMaskView;
@end

NS_ASSUME_NONNULL_END
