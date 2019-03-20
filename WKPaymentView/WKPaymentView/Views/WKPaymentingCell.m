//
//  WKPaymentingCell.m
//  WKPaymentView
//
//  Created by apple on 18/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "WKPaymentingCell.h"

@implementation WKPaymentingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)mBtnAction:(UIButton *)sender {
    if (self.mBlock) {
        self.mBlock(sender.tag);
    }
    
}


- (void)WKUpdateLoadingAnimat:(ALLoadingViewResultType)mType andMessage:(NSString *)message{
    
    self.mLoadingView.successColor = KMethodColor;
    self.mLoadingView.errorColor = KMethodColor;
    self.mLoadingView.loadingColor = KMethodColor;
    self.mLoadingView.exclamationColor = KMethodColor;
    
    self.mLoadingView.radius = 20;
    
    if (mType == ALLoadingViewResultTypeLoading) {
        
        [self.mLoadingView start];
        
    }else if (mType == ALLoadingViewResultTypeSuccess) {
        [self.mLoadingView endAnimationWithResult:ALLoadingViewResultTypeSuccess];
        
        
    }else if (mType == ALLoadingViewResultTypeError) {
        [self.mLoadingView endAnimationWithResult:ALLoadingViewResultTypeError];
        
    }else if (mType == ALLoadingViewResultTypeExclamationMark) {
        [self.mLoadingView endAnimationWithResult:ALLoadingViewResultTypeExclamationMark];
        
    }
}
@end
