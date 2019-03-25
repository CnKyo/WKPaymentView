//
//  WKPaymentMethodCell.h
//  WKPaymentView
//
//  Created by 王钶 on 13/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^WKPaymentMethodCellBtnClickBlock)(WKPaymentBtnModel mTag,WKPaymentMethodModel *mCurrentMethod);

@interface WKPaymentMethodCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>

@property (copy,nonatomic) WKPaymentMethodCellBtnClickBlock mBtnBlock;

@property (weak, nonatomic) IBOutlet UIImageView *mLeftImage;

@property (weak, nonatomic) IBOutlet UIButton *mLeftBtn;

@property (weak, nonatomic) IBOutlet UILabel *mTitle;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (weak, nonatomic) IBOutlet UIButton *mGoPayBtn;

@property (strong,nonatomic) NSMutableArray *mMethods;

@property (strong,nonatomic) WKPaymentMethodModel *mCurrentMethod;

- (void)loadPaymentMethod:(NSArray *)dataSource;

@end

NS_ASSUME_NONNULL_END
