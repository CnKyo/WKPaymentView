//
//  WKPayTableView.h
//  WKPaymentView
//
//  Created by apple on 14/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKPaymentView.h"
NS_ASSUME_NONNULL_BEGIN

@protocol WKPayTableViewDidBtnClickDelegate <NSObject>

@optional

- (void)WKPayTableViewPaymentDetailDidClicked:(WKPaymentBtnModel)mTag;

- (void)WKPayTableViewPaymentMethodDidClicked:(WKPaymentBtnModel)mTag;


@end

@interface WKPayTableView : UIView<UITableViewDelegate,UITableViewDataSource>

+ (WKPayTableView *)initView;

@property (assign,nonatomic) WKPaymentType mPayViewType;

@property (assign,nonatomic) WKPaymentModel *model;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (weak,nonatomic) id<WKPayTableViewDidBtnClickDelegate> delegate;

#pragma mark----****----传递方法
- (void)WKShowPaymentDetail:(WKPaymentModel *)model;
- (void)WKShowPaymentMethod:(WKPaymentModel *)model;

@end

NS_ASSUME_NONNULL_END
