//
//  WKPayDetailCrossBorderCell.h
//  WKPaymentView
//
//  Created by 王钶 on 20/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WKPayDetailCrossBorderCellBtnClickBlock)(WKPaymentBtnModel mTag);

@interface WKPayDetailCrossBorderCell : UITableViewCell

@property (copy,nonatomic) WKPayDetailCrossBorderCellBtnClickBlock mBtnBlock;

/**
 左边的图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *mLeftImage;
/**
 左边的按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *mLeftBtn;
/**
 标题
 */
@property (weak, nonatomic) IBOutlet UILabel *mTitle;
/**
 金额
 */
@property (weak, nonatomic) IBOutlet UILabel *mAmount;
/**
 类型lb
 */
@property (weak, nonatomic) IBOutlet UILabel *mCategoryLb;
/**
 类型内容
 */
@property (weak, nonatomic) IBOutlet UILabel *mCategory;

@property (weak, nonatomic) IBOutlet UILabel *mRateLb;

@property (weak, nonatomic) IBOutlet UILabel *mRate;

/**
 商家lb
 */
@property (weak, nonatomic) IBOutlet UILabel *mMerchantLb;
/**
 商家内容
 */
@property (weak, nonatomic) IBOutlet UILabel *mMerchant;
/**
 支付类型lb
 */
@property (weak, nonatomic) IBOutlet UILabel *mMethodLb;
/**
 支付类型
 */
@property (weak, nonatomic) IBOutlet UILabel *mMethod;
/**
 箭头图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *mArrowImage;
/**
 选择支付类型按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *mMethodBtn;
/**
 去支付按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *mPayBtn;

#pragma mark----****----判断是否有优惠卷
/**
 支付方式线左边的约束(默认为0,如果有优惠卷,则在下方添加优惠卷view并将此值设置为16)
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mMethodLingLeft;
/**
 优惠卷view(默认隐藏状态,如果有优惠卷显示,否则隐藏)
 */
@property (weak, nonatomic) IBOutlet UIView *mCouponView;
/**
 优惠卷标题
 */
@property (weak, nonatomic) IBOutlet UILabel *mCouponLb;
/**
 优惠卷内容
 */
@property (weak, nonatomic) IBOutlet UILabel *mCoupon;
/**
 优惠卷箭头
 */
@property (weak, nonatomic) IBOutlet UIImageView *mCouponArrow;

/**
 选择优惠卷按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *mCouponBtn;
/**
 优惠卷线左边的约束(默认为0)
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mCouponLineLeft;
@end

NS_ASSUME_NONNULL_END
