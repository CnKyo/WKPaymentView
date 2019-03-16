//
//  WKPaymentDetailCell.h
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WKPaymentDetailCellBtnClickBlock)(WKPaymentBtnModel mTag);

@interface WKPaymentDetailCell : UITableViewCell

@property (copy,nonatomic) WKPaymentDetailCellBtnClickBlock mBtnBlock;

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

@end

NS_ASSUME_NONNULL_END
