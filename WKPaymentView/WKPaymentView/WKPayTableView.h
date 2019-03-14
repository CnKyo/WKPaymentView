//
//  WKPayTableView.h
//  WKPaymentView
//
//  Created by apple on 14/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKPayTableView : UIView<UITableViewDelegate,UITableViewDataSource>

+ (WKPayTableView *)initView;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;


@end

NS_ASSUME_NONNULL_END
