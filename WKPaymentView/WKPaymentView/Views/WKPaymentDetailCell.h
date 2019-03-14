//
//  WKPaymentDetailCell.h
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^WKPaymentDetailCellBtnClickBlock)(NSInteger mTag);
@interface WKPaymentDetailCell : UITableViewCell

@property (copy,nonatomic) WKPaymentDetailCellBtnClickBlock mBtnBlock;

@end

NS_ASSUME_NONNULL_END
