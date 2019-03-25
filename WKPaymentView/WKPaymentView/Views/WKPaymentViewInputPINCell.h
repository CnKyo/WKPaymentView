//
//  WKPaymentViewInputPINCell.h
//  WKPaymentView
//
//  Created by 王钶 on 18/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WKPaymentViewInputPINCellBtnBlock)(WKPaymentBtnModel mTag);

typedef void(^WKPaymentViewInputPINCellPINCodeDidInputBlock)(NSString *mPinText);

@interface WKPaymentViewInputPINCell : UITableViewCell

@property (copy,nonatomic) WKPaymentViewInputPINCellBtnBlock mBtnBlock;

@property (copy,nonatomic) WKPaymentViewInputPINCellPINCodeDidInputBlock mInputPinBlock;

@property (weak, nonatomic) IBOutlet UIImageView *mLeftImage;

@property (weak, nonatomic) IBOutlet UIButton *mLeftBtn;

@property (weak, nonatomic) IBOutlet UILabel *mTitle;

@property (weak, nonatomic) IBOutlet UIView *mPinCodeView;

@property (weak, nonatomic) IBOutlet UIButton *mForgetBtn;



@end

NS_ASSUME_NONNULL_END
