//
//  WKSetUpPINCell.m
//  WKPaymentView
//
//  Created by apple on 20/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "WKSetUpPINCell.h"
#import "WKCustomCodeView.h"

@interface WKSetUpPINCell ()
@property (strong,nonatomic) WKCustomCodeView *mPINView;

@end

@implementation WKSetUpPINCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    __weak typeof(self) weakSelf = self;
    
    self.mPINView = [WKCustomCodeView sharePayViewWithType:WKCustomCodeTypeSecurety];
    
    //    self.mPayView.frame = CGRectMake(0, 0, kScreenWidth, 55);
    [self.mPINView WKShowKeyborad];
    self.mPINView.mTextBlock = ^(NSString *mText) {
        if (mText.length>=6) {
            if (weakSelf.mInputPinBlock) {
                weakSelf.mInputPinBlock(mText);
                
            }
            [weakSelf.mPINView WKClearnText];
        }
    };
    self.mPINView.frame = self.mPinCodeView.bounds;
    [self.mPinCodeView addSubview:self.mPINView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)mBtnAction:(UIButton *)sender {
    if (self.mBtnBlock) {
        self.mBtnBlock(sender.tag);
    }
    
}
@end
