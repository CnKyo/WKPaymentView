//
//  WKSetUpPINCell.h
//  WKPaymentView
//
//  Created by apple on 20/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WKSetUpPINCellBtnBlock)(WKPaymentBtnModel mTag);

typedef void(^WKSetUpPINCellPINCodeDidInputBlock)(NSString *mPinText);

@interface WKSetUpPINCell : UITableViewCell

@property (copy,nonatomic) WKSetUpPINCellBtnBlock mBtnBlock;

@property (copy,nonatomic) WKSetUpPINCellPINCodeDidInputBlock mInputPinBlock;

@property (weak, nonatomic) IBOutlet UIImageView *mLeftImage;

@property (weak, nonatomic) IBOutlet UIButton *mLeftBtn;

@property (weak, nonatomic) IBOutlet UILabel *mTitle;

@property (weak, nonatomic) IBOutlet UIView *mPinCodeView;

@end

NS_ASSUME_NONNULL_END
