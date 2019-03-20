//
//  WKAddPaymentMethodCell.h
//  WKPaymentView
//
//  Created by apple on 20/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKAddPaymentMethodCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mLogo;

@property (weak, nonatomic) IBOutlet UILabel *mTitle;

@property (weak, nonatomic) IBOutlet UIImageView *mArrow;

@end

NS_ASSUME_NONNULL_END
