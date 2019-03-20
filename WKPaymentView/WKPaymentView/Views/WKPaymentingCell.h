//
//  WKPaymentingCell.h
//  WKPaymentView
//
//  Created by apple on 18/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALLoadingView.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^WKPaymentingCellBtnBlock)(WKPaymentBtnModel mTag);

@interface WKPaymentingCell : UITableViewCell

@property (copy,nonatomic) WKPaymentingCellBtnBlock mBlock;

@property (weak, nonatomic) IBOutlet UIImageView *mLeftImage;

@property (weak, nonatomic) IBOutlet UIButton *mLeftBtn;

@property (weak, nonatomic) IBOutlet UILabel *mTitle;

@property (weak, nonatomic) IBOutlet ALLoadingView *mLoadingView;

@property (weak, nonatomic) IBOutlet UILabel *mLoadingContent;

- (void)WKUpdateLoadingAnimat:(ALLoadingViewResultType)mType andMessage:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
