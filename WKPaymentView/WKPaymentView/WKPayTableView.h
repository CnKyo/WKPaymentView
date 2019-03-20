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

- (void)WKPayTableViewPaymentMethodDidClicked:(WKPaymentBtnModel)mTag andSelectedMethod:(WKPaymentMethodModel *)mCurrentMethod;

- (void)WKPayTableViewPaymentPINCodeHandle:(NSString *)mPIN;
@end

@interface WKPayTableView : UIView<UITableViewDelegate,UITableViewDataSource>

+ (WKPayTableView *)initView;

@property (assign,nonatomic) WKPaymentType mPayViewType;

@property (assign,nonatomic) WKPaymentModel *model;

@property (strong,nonatomic) NSString *messgae;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (strong,nonatomic) NSMutableArray *mMethods;

@property (weak,nonatomic) id<WKPayTableViewDidBtnClickDelegate> delegate;


#pragma mark----****----传递方法
- (void)WKShowPaymentDetail:(WKPaymentModel *)model;
- (void)WKShowPaymentMethod:(WKPaymentModel *)model;
- (void)WKShowPaymentPIN:(WKPaymentModel *)model;
- (void)loadPaymentMethod:(NSArray *)dataSource;

- (void)WKShowPaymentLoading:(ALLoadingViewResultType)mType andMessage:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
