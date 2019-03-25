//
//  WKPaymentDetailCell.m
//  WKPaymentView
//
//  Created by 王钶 on 13/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
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
-(void)setMPayModel:(WKPaymentModel *)mPayModel{
    if (mPayModel.mTitle.length>0) {
        self.mTitle.text = mPayModel.mTitle;
    }
    
}
@end
