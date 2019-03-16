//
//  WKPaymentMethodCell.h
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^WKPaymentMethodCellBtnClickBlock)(WKPaymentBtnModel mTag);

@interface WKPaymentMethodCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>

@property (copy,nonatomic) WKPaymentMethodCellBtnClickBlock mBtnBlock;

@property (weak, nonatomic) IBOutlet UIImageView *mLeftImage;

@property (weak, nonatomic) IBOutlet UIButton *mLeftBtn;

@property (weak, nonatomic) IBOutlet UILabel *mTitle;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (weak, nonatomic) IBOutlet UIButton *mGoPayBtn;

@end

NS_ASSUME_NONNULL_END
