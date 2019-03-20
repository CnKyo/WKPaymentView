//
//  WKPaymenMethodSubCell.h
//  WKPaymentView
//
//  Created by apple on 16/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKPaymenMethodSubCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mLogo;

@property (weak, nonatomic) IBOutlet UILabel *mMethodName;

@property (weak, nonatomic) IBOutlet UILabel *mBalance;

@property (weak, nonatomic) IBOutlet UIImageView *mSelectedImage;

@end

NS_ASSUME_NONNULL_END
