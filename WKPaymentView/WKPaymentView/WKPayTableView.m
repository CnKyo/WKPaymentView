//
//  WKPayTableView.m
//  WKPaymentView
//
//  Created by apple on 14/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "WKPayTableView.h"

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
    
    
    UINib   *nib = [UINib nibWithNibName:@"WKPaymentDetailCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"paymentDetailCell"];
    
    nib = [UINib nibWithNibName:@"WKPaymentDetailCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"paymentDetailCell"];
    
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
    
    static NSString *string = @"paymentDetailCell";
    string = @"paymentDetailCell";
    WKPaymentDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.mBtnBlock = ^(NSInteger mIndex) {
        
    };
    return cell;
    //    }
    //    else if (tableView == self.mMidTableView) {
    //        string = @"paymentMethodCell";
    //        WKPaymentMethodCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //        cell.mBtnBlock = ^(NSInteger mIndex) {
    //
    //
    //        };
    //        return cell;
    //    }
   
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect mFrame = [UIScreen mainScreen].bounds;
    NSLog(@"cell 的高:%f",mFrame.size.height*0.67);
    
    return mFrame.size.height*0.67;
}

@end
