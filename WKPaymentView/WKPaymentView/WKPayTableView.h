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

- (void)WKPayTableViewPaymentDetailDidClicked:(NSInteger)mTag;

@end

@interface WKPayTableView : UIView<UITableViewDelegate,UITableViewDataSource>

+ (WKPayTableView *)initView;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (weak,nonatomic) id<WKPayTableViewDidBtnClickDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
