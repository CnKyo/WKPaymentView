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
#import "WKPaymentViewInputPINCell.h"
#import "WKPaymentingCell.h"
#import "WKSetUpPINCell.h"
#import "WKPayDetailCrossBorderCell.h"
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

    nib = [UINib nibWithNibName:@"WKPaymentViewInputPINCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"paymentPINCell"];
    
    nib = [UINib nibWithNibName:@"WKPaymentingCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"paymentLoadingCell"];
    
    nib = [UINib nibWithNibName:@"WKSetUpPINCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"setPINCell"];
    
    nib = [UINib nibWithNibName:@"WKPayDetailCrossBorderCell" bundle:nil];
    [view.mTableView registerNib:nib forCellReuseIdentifier:@"crosborderCell"];
    
    view.mMethods = [NSMutableArray new];

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
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentDetailDidClicked:andType:)]) {
                [weakSelf.delegate WKPayTableViewPaymentDetailDidClicked:mIndex andType:self.mPayViewType];
            }

        };
        return cell;
    }
    else if (self.mPayViewType == WKPaymentMethod){
        string = @"paymentMethodCell";
        WKPaymentMethodCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.mBtnBlock = ^(WKPaymentBtnModel mIndex,WKPaymentMethodModel *mCurrentMethod) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentMethodDidClicked:andSelectedMethod:)]) {
                [weakSelf.delegate WKPayTableViewPaymentMethodDidClicked:mIndex andSelectedMethod:mCurrentMethod];
            }

        };
        [cell loadPaymentMethod:self.mMethods];
        return cell;
    }
    else if (self.mPayViewType == WKPaymentInputPINCode){
        string = @"paymentPINCell";
        WKPaymentViewInputPINCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
       
        cell.mBtnBlock = ^(WKPaymentBtnModel mTag) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentDetailDidClicked:andType:)]) {
                [weakSelf.delegate WKPayTableViewPaymentDetailDidClicked:mTag andType:self.mPayViewType];
            }
        };
        cell.mInputPinBlock = ^(NSString * _Nonnull mPinText) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentPINCodeHandle:)]) {
                [weakSelf.delegate WKPayTableViewPaymentPINCodeHandle:mPinText];
            }
        };
        return cell;
    }
    else if (self.mPayViewType == WKPaymenting){
        
        NSInteger mAnimatModel = [[[NSUserDefaults standardUserDefaults]valueForKey:@"animationModel"] integerValue];

        
        string = @"paymentLoadingCell";
        WKPaymentingCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.mBlock = ^(WKPaymentBtnModel mTag) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentDetailDidClicked:andType:)]) {
                [weakSelf.delegate WKPayTableViewPaymentDetailDidClicked:mTag andType:self.mPayViewType];
            }
        };
        [cell WKUpdateLoadingAnimat:mAnimatModel andMessage:self.messgae];
        return cell;
    }
    else if (self.mPayViewType == WKSetPaymentPIN){
        
        string = @"setPINCell";
        WKSetUpPINCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
     
        cell.mBtnBlock = ^(WKPaymentBtnModel mTag) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentDetailDidClicked:andType:)]) {
                [weakSelf.delegate WKPayTableViewPaymentDetailDidClicked:mTag andType:self.mPayViewType];
            }
        };
        
        cell.mInputPinBlock = ^(NSString * _Nonnull mPinText) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentPINCodeHandle:)]) {
                [weakSelf.delegate WKPayTableViewPaymentPINCodeHandle:mPinText];
            }
        };

        return cell;
    }
    else if (self.mPayViewType == WKCrosBorderPayment){
        
        string = @"crosborderCell";
        WKPayDetailCrossBorderCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.mBtnBlock = ^(WKPaymentBtnModel mTag) {
            if ([weakSelf.delegate respondsToSelector:@selector(WKPayTableViewPaymentDetailDidClicked:andType:)]) {
                [weakSelf.delegate WKPayTableViewPaymentDetailDidClicked:mTag andType:self.mPayViewType];
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

    NSArray *mArr = @[@"balance",@"card"];
    
 
    
    [self loadPaymentMethod:mArr];
}
- (void)WKShowPaymentPIN:(WKPaymentModel *)model{
    self.model = model;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%ld",WKPaymentInputPINCode] forKey:@"type"];
    [self.mTableView reloadData];

}
- (void)loadPaymentMethod:(NSArray *)dataSource{
    if (!self.mMethods) {
        self.mMethods = [NSMutableArray new];
    }
    [self.mMethods removeAllObjects];
    for (NSUInteger i = 0; i<2; i++) {
        WKPaymentMethodModel *method = [WKPaymentMethodModel new];
        method.mTitle = dataSource[i];
        if (i==0) {
            method.selected = YES;
        }else{
            method.selected = NO;
        }
        [self.mMethods addObject:method];

    }
    
    [self.mTableView reloadData];
}
- (void)WKShowPaymentLoading:(ALLoadingViewResultType)mType andMessage:(NSString *)message{

    self.messgae = message;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%ld",WKPaymenting] forKey:@"type"];
    
    NSUserDefaults *animationModel = [NSUserDefaults standardUserDefaults];
    [animationModel setValue:[NSString stringWithFormat:@"%ld",mType] forKey:@"animationModel"];
    [self.mTableView reloadData];
}

/**
 显示汇款类型/跨境支付类型
 
 @param model 支付数据模型
 */
- (void)WKShowCrosBorder:(WKPaymentModel *)model{
    self.model = model;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%ld",WKCrosBorderPayment] forKey:@"type"];
    [self.mTableView reloadData];
}

#pragma mark----****----设置支付密码
- (void)WKShowSetPINCode:(WKPaymentModel *)model{
    self.model = model;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%ld",WKSetPaymentPIN] forKey:@"type"];
    [self.mTableView reloadData];
    
}
@end
