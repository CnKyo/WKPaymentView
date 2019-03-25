//
//  WKPaymentView.m
//  WKPaymentView
//
//  Created by 王钶 on 13/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import "WKPaymentView.h"
#import "WKPayTableView.h"

#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

#define KRBGColorAlpha(_R_, _G_, _B_,_Alpha_)       ([UIColor colorWithRed:_R_/255.0f green:_G_/255.0f blue:_B_/255.0f alpha:_Alpha_])
#define kStatusBarHeight        CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])


@interface WKPaymentView ()<WKPayTableViewDidBtnClickDelegate>
@property (strong,nonatomic) WKPayTableView *mLeftPayTableView;

@property (strong,nonatomic) WKPayTableView *mMidPayTableView;

@property (strong,nonatomic) WKPayTableView *mRightPayTableView;
@end

@implementation WKPaymentView
/**
 初始化方法
 
 @return 返回view
 */
+ (WKPaymentView *)initView{
    
    WKPaymentView *view = [[[NSBundle mainBundle] loadNibNamed:@"WKPaymentView" owner:self options:nil] objectAtIndex:0];
    
   
    view.mLeftPayTableView = [WKPayTableView initView];
    view.mMidPayTableView = [WKPayTableView initView];
    view.mRightPayTableView = [WKPayTableView initView];
    
    view.mLeftPayTableView.delegate = view;
    view.mMidPayTableView.delegate = view;
    view.mRightPayTableView.delegate = view;

    view.mLeftPayTableView.frame = view.mLeftTableView.bounds;
    view.mMidPayTableView.frame = view.mLeftTableView.bounds;
    view.mRightPayTableView.frame = view.mLeftTableView.bounds;

    [view.mLeftTableView addSubview:view.mLeftPayTableView];
    [view.mMidTableView addSubview:view.mMidPayTableView];
    [view.mRightTableView addSubview:view.mRightPayTableView];
    
    
    return view;
    
}
/**
 显示方法
 
 @param VC 显示到当前ViewController
 */
- (void)WKShowPaymentViewInVC:(UIViewController *)VC{
    if (self.superview) {///<-这一句代码很重要,为了防止多个方法嵌套加载,如果不这样写会导致无法加载视图
        return;
    }
    self.mMaskView.alpha = 0;

    CGRect mFrame = [UIApplication sharedApplication].keyWindow.bounds;
    mFrame.origin.y = kScreenHeight;
    self.frame = mFrame;
    [VC.view.window addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect mTotleFrame = self.frame;
        mTotleFrame.origin.y = 0;
        self.frame = mTotleFrame;
    } completion:^(BOOL finished) {
        self.mNavMaskView.alpha = 1;
        self.mMaskView.alpha = 1;

    }];
}
/**
 隐藏支付view(只是hidden并非移除)
 */
- (void)WKHiddenPaymentView:(BOOL)mHidden{
    self.hidden = mHidden;
}
/**
 移除支付view
 */
- (void)WKRemovePaymentView{
    self.mNavMaskView.alpha = 0;
    self.mMaskView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect mTotleFrame = self.frame;
        mTotleFrame.origin.y = kScreenHeight;
        self.frame = mTotleFrame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)loadDetail{
    self.mPayViewType = WKPaymentDetail;
}
- (void)loadMethod{
}


#pragma mark----****----视图移动动画
/**
 左边移动到中间
 */
- (void)WKLeftToMid{
    self.mDisPalyPayViewType = WKPayTableViewDisPlayMid;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect mLeftFrame = self.mLeftTableView.frame;
        CGRect mMidFrame = self.mMidTableView.frame;
        CGRect mRightFrame = self.mRightTableView.frame;
        
        mLeftFrame.origin.x-=kScreenWidth;
        mMidFrame.origin.x = 0;
        mRightFrame.origin.x = kScreenWidth;
        
        self.mLeftTableView.frame = mLeftFrame;
        self.mMidTableView.frame = mMidFrame;
        self.mRightTableView.frame = mRightFrame;
    }];
    [self allTableLoad];
}
/**
 中间移动到右边
 */
- (void)WKMidToRight{
    self.mDisPalyPayViewType = WKPayTableViewDisPlayRight;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect mLeftFrame = self.mLeftTableView.frame;
        CGRect mMidFrame = self.mMidTableView.frame;
        CGRect mRightFrame = self.mRightTableView.frame;
        
        mLeftFrame.origin.x-=kScreenWidth*2;
        mMidFrame.origin.x -= kScreenWidth;
        mRightFrame.origin.x = 0;
        
        self.mLeftTableView.frame = mLeftFrame;
        self.mMidTableView.frame = mMidFrame;
        self.mRightTableView.frame = mRightFrame;
    }];
    [self allTableLoad];
}
/**
 左边往右边移动
 */
- (void)WKLeftToRight{
    self.mDisPalyPayViewType = WKPayTableViewDisPlayRight;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect mLeftFrame = self.mLeftTableView.frame;
        CGRect mMidFrame = self.mMidTableView.frame;
        CGRect mRightFrame = self.mRightTableView.frame;
        
        mLeftFrame.origin.x = -kScreenWidth*2;
        mMidFrame.origin.x = -kScreenWidth;
        mRightFrame.origin.x = 0;
        
        self.mLeftTableView.frame = mLeftFrame;
        self.mMidTableView.frame = mMidFrame;
        self.mRightTableView.frame = mRightFrame;
    }];
    [self allTableLoad];
}
/**
 右边往左边移动
 */
- (void)WKRightToLeft{
    self.mDisPalyPayViewType = WKPayTableViewDisPlayLeft;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect mLeftFrame = self.mLeftTableView.frame;
        CGRect mMidFrame = self.mMidTableView.frame;
        CGRect mRightFrame = self.mRightTableView.frame;
        
        mLeftFrame.origin.x = 0;
        mMidFrame.origin.x = kScreenWidth;
        mRightFrame.origin.x = kScreenWidth*2;
        
        self.mLeftTableView.frame = mLeftFrame;
        self.mMidTableView.frame = mMidFrame;
        self.mRightTableView.frame = mRightFrame;
    }];
    [self allTableLoad];
}
/**
 右边移动到中间
 */
- (void)WKRightToMid{
    [UIView animateWithDuration:0.5 animations:^{
        self.mDisPalyPayViewType = WKPayTableViewDisPlayMid;
        CGRect mLeftFrame = self.mLeftTableView.frame;
        CGRect mMidFrame = self.mMidTableView.frame;
        CGRect mRightFrame = self.mRightTableView.frame;
        
        mLeftFrame.origin.x -= kScreenWidth;
        mMidFrame.origin.x = 0;
        mRightFrame.origin.x = kScreenWidth;
        
        self.mLeftTableView.frame = mLeftFrame;
        self.mMidTableView.frame = mMidFrame;
        self.mRightTableView.frame = mRightFrame;
    }];
    [self allTableLoad];
}
/**
 中间移动到左边
 */
- (void)WKMidToLeft{
    [UIView animateWithDuration:0.5 animations:^{
        self.mDisPalyPayViewType = WKPayTableViewDisPlayLeft;
        CGRect mLeftFrame = self.mLeftTableView.frame;
        CGRect mMidFrame = self.mMidTableView.frame;
        CGRect mRightFrame = self.mRightTableView.frame;
        
        mLeftFrame.origin.x = 0;
        mMidFrame.origin.x = kScreenWidth;
        mRightFrame.origin.x = kScreenWidth*2;
        
        self.mLeftTableView.frame = mLeftFrame;
        self.mMidTableView.frame = mMidFrame;
        self.mRightTableView.frame = mRightFrame;
    }];
    [self allTableLoad];
}
- (void)allTableLoad{
//    [self.mLeftTableView reloadData];
//    [self.mMidTableView reloadData];
//    [self.mRightTableView reloadData];
}


#pragma mark----****----列表点击的代理方法
- (void)WKPayTableViewPaymentDetailDidClicked:(WKPaymentBtnModel)mTag andType:(WKPaymentType)type{
//    [self WKLeftToMid];
    if (self.WKPayDetailViewHandle) {
        self.WKPayDetailViewHandle(mTag,type);
    }
    
}
- (void)WKPayTableViewPaymentMethodDidClicked:(WKPaymentBtnModel)mTag andSelectedMethod:(nonnull WKPaymentMethodModel *)mCurrentMethod{
    if (self.WKPayMethodViewHandle) {
        self.WKPayMethodViewHandle(mTag,mCurrentMethod);
    }
}
- (void)WKPayTableViewPaymentPINCodeHandle:(NSString *)mPIN{
    NSLog(@"you are input:%@",mPIN);
    if (self.WKPayPINCodeViewHandle) {
        self.WKPayPINCodeViewHandle(mPIN);
    }
}

#pragma mark----****----传递方法
- (void)WKShowPaymentDetail:(WKPaymentModel *)model{
    
    [self WKMidToLeft];
    [self.mLeftPayTableView WKShowPaymentDetail:model];
}
- (void)WKShowPaymentMethod:(WKPaymentModel *)model{
    
    [self WKLeftToMid];
    [self.mMidPayTableView WKShowPaymentMethod:model];

}
- (void)WKShowPaymentPIN:(WKPaymentModel *)model{
    [self WKLeftToMid];
    [self.mMidPayTableView WKShowPaymentPIN:model];
}
- (void)WKShowPaymentLoading:(ALLoadingViewResultType)mType andMessage:(NSString *)message{
    [self WKMidToRight];
    [self.mRightPayTableView WKShowPaymentLoading:mType andMessage:message];
}
/**
 显示汇款类型/跨境支付类型
 
 @param model 支付数据模型
 */
- (void)WKShowCrosBorder:(WKPaymentModel *)model{
    [self WKMidToLeft];
    [self.mLeftPayTableView WKShowCrosBorder:model];
}
#pragma mark----****----设置支付密码
- (void)WKShowSetPINCode:(WKPaymentModel *)model{
    [self WKMidToLeft];
    [self.mLeftPayTableView WKShowSetPINCode:model];
}
@end
