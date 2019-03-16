//
//  WKPayTableView.m
//  WKPaymentView
//
//  Created by apple on 14/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "WKPayTableView.h"
#import "WKPaymentDefaultCell.h"
#import "WKPaymentDetailCell.h"
#import "WKPaymentMethodCell.h"

#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

#define KRBGColorAlpha(_R_, _G_, _B_,_Alpha_)       ([UIColor colorWithRed:_R_/255.0f green:_G_/255.0f blue:_B_/255.0f alpha:_Alpha_])
@implementation WKPayTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (WKPayTableView *)initView{
    WKPayTableView *view = [[[NSBundle mainBundle] loadNibNamed:@"WKPayTableView" owner:self options:nil] objectAtIndex:0];
    
    view.mTableView.delegate = view;
    view.mTableView.dataSource = view;
    view.mTableView.scrollEnabled = NO;
    
    ///默认ui
    UINib   *nib = [UINib nibWithNibName:@"WKPaymentDefaultCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"defaultCell"];
    
    nib = [UINib nibWithNibName:@"WKPaymentDetailCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"paymentDetailCell"];
    
    nib = [UINib nibWithNibName:@"WKPaymentMethodCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"paymentMethodCell"];

    
    return view;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    __weak typeof(self) weakSelf = self;
    self.mPayViewType = [[[NSUserDefaults standardUserDefaults]valueForKey:@"type"] integerValue];

    static NSString *string = @"paymentDetailCell";
    if (self.mPayViewType == WKPaymentDetail) {
        string = @"paymentDetailCell";
        WKPaymentDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.mBtnBlock = ^(WKPaymentBtnModel mIndex) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentDetailDidClicked:)]) {
                [weakSelf.delegate WKPayTableViewPaymentDetailDidClicked:mIndex];
            }

        };
        return cell;
    }
    else if (self.mPayViewType == WKPaymentMethod){
        string = @"paymentMethodCell";
        WKPaymentMethodCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.mBtnBlock = ^(WKPaymentBtnModel mIndex) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentMethodDidClicked:)]) {
                [weakSelf.delegate WKPayTableViewPaymentMethodDidClicked:mIndex];
            }

        };
        return cell;
    }
    else{

        string = @"defaultCell";
        WKPaymentDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }


   
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect mFrame = [UIScreen mainScreen].bounds;
    NSLog(@"cell 的高:%f",mFrame.size.height*0.67);
    
    return mFrame.size.height*0.67;
}
#pragma mark----****----传递方法
- (void)WKShowPaymentDetail:(WKPaymentModel *)model{
    self.model = model;
 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%ld",WKPaymentDetail] forKey:@"type"];
    
    [self.mTableView reloadData];
}
- (void)WKShowPaymentMethod:(WKPaymentModel *)model{
    self.model = model;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%ld",WKPaymentMethod] forKey:@"type"];

    
    [self.mTableView reloadData];
}
@end
