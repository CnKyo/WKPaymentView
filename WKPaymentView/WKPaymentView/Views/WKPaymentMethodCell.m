//
//  WKPaymentMethodCell.m
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "WKPaymentMethodCell.h"
#import "WKPaymenMethodSubCell.h"
@implementation WKPaymentMethodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.mMethods = [NSMutableArray new];
    
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    
    UINib   *nib = [UINib nibWithNibName:@"WKPaymenMethodSubCell" bundle:nil];
    [self.mTableView registerNib:nib forCellReuseIdentifier:@"balanceCell"];
    
    nib = [UINib nibWithNibName:@"WKPaymenMethodBankCell" bundle:nil];
    [self.mTableView registerNib:nib forCellReuseIdentifier:@"bankCell"];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)mBtnAction:(UIButton *)sender {
    if (self.mBtnBlock) {
        self.mBtnBlock(sender.tag,self.mCurrentMethod);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mMethods.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *string = @"balanceCell";

//    self.mPayViewType = [[[NSUserDefaults standardUserDefaults]valueForKey:@"type"] integerValue];
    WKPaymentMethodModel *method = self.mMethods[indexPath.row];
    if ([method.mTitle isEqualToString:@"balance"]) {
        string = @"balanceCell";
        WKPaymenMethodSubCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (method.selected == YES) {
            cell.mSelectedImage.image = [UIImage yh_imageNamed:@"ic_choose_green"];
        }else{
            cell.mSelectedImage.image = [UIImage yh_imageNamed:@""];
        }
        return cell;
    }else{
        string = @"bankCell";
        WKPaymenMethodSubCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (method.selected == YES) {
            cell.mSelectedImage.image = [UIImage yh_imageNamed:@"ic_choose_green"];
        }else{
            cell.mSelectedImage.image = [UIImage yh_imageNamed:@""];
        }
        return cell;
    }

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WKPaymentMethodModel *mCurrentMethod = self.mMethods[indexPath.row];
    self.mCurrentMethod = mCurrentMethod;
    for (NSInteger i = 0;i<self.mMethods.count;i++) {
        WKPaymentMethodModel *method = self.mMethods[i];
        method.selected = NO;
        if ([mCurrentMethod.mTitle isEqualToString:method.mTitle]) {
            method.selected = YES;
        }
        [self.mMethods replaceObjectAtIndex:i withObject:method];
    }
    [self.mTableView reloadData];
}

- (void)loadPaymentMethod:(NSArray *)dataSource{
    if (!self.mMethods) {
        self.mMethods = [NSMutableArray new];
    }
    [self.mMethods removeAllObjects];
    [self.mMethods addObjectsFromArray:dataSource];
    
    [self.mTableView reloadData];
}

@end
