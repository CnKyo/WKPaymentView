//
//  WKPaymentDetailTwoCell.m
//  WKPaymentView
//
//  Created by 王钶 on 20/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import "WKPaymentDetailTwoCell.h"

@implementation WKPaymentDetailTwoCell

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
