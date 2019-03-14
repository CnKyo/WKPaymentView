//
//  WKPaymentDetailCell.m
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "WKPaymentDetailCell.h"

@implementation WKPaymentDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
