//
//  WKPaymentView.m
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "WKPaymentView.h"
#import "WKPayTableView.h"

#import "AGWindowView.h"

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
//    [self WKAddNavMaskView];
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
    if (mHidden) {
        [self WKRemoveNavMaskView];
    }else{
        [self WKAddNavMaskView];
        self.mNavMaskView.alpha = 1;
    }
    
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
        [self WKRemoveNavMaskView];
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
- (void)WKPayTableViewPaymentDetailDidClicked:(WKPaymentBtnModel)mTag{
//    [self WKLeftToMid];
    if (self.WKPayDetailViewHandle) {
        self.WKPayDetailViewHandle(mTag);
    }
    
}
- (void)WKPayTableViewPaymentMethodDidClicked:(WKPaymentBtnModel)mTag{
    if (self.WKPayMethodViewHandle) {
        self.WKPayMethodViewHandle(mTag);
    }
}

#pragma mark----****----添加导航条蒙层view
- (void)WKAddNavMaskView{
    self.mNavMaskView = [UIView new];
    self.mNavMaskView.frame = CGRectMake(0, 0, kScreenWidth, 44+kStatusBarHeight);
    self.mNavMaskView.backgroundColor = self.mMaskView.backgroundColor;
    self.mNavMaskView.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:self.mNavMaskView];
}
#pragma mark----****----移除导航条蒙层view
- (void)WKRemoveNavMaskView{
    [self.mNavMaskView removeFromSuperview];
}


#pragma mark----****----传递方法
- (void)WKShowPaymentDetail:(WKPaymentModel *)model{
    
    [self WKMidToLeft];
    [self.mMidPayTableView WKShowPaymentDetail:model];
}
- (void)WKShowPaymentMethod:(WKPaymentModel *)model{
    
    [self WKLeftToMid];
    [self.mMidPayTableView WKShowPaymentMethod:model];

}

@end
