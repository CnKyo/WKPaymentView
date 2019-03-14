//
//  WKPaymentView.m
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "WKPaymentView.h"

#import "AGWindowView.h"

#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

#define KRBGColorAlpha(_R_, _G_, _B_,_Alpha_)       ([UIColor colorWithRed:_R_/255.0f green:_G_/255.0f blue:_B_/255.0f alpha:_Alpha_])


@interface WKPaymentView ()

@property (strong,nonatomic) UIViewController *mCurrentVC;

@end

@implementation WKPaymentView

+ (WKPaymentView *)initView{
    
    WKPaymentView *view = [[[NSBundle mainBundle] loadNibNamed:@"WKPaymentView" owner:self options:nil] objectAtIndex:0];
    
    CGRect mFrame = [UIApplication sharedApplication].keyWindow.bounds;
    mFrame.origin.y = kScreenHeight*0.33;
    mFrame.size.height = kScreenHeight*0.67;
    view.mLeftTableView = [WKPayTableView initView];
    view.mMidTableView = [WKPayTableView initView];
    view.mRightTableView = [WKPayTableView initView];
    
    view.mLeftTableView.frame = mFrame;
    view.mMidTableView.frame = mFrame;
    view.mRightTableView.frame = mFrame;
    
    [view addSubview:view.mLeftTableView];
    [view addSubview:view.mMidTableView];
    [view addSubview:view.mRightTableView];
    
    return view;
    
}
/**
 显示方法
 
 @param VC 显示到当前ViewController
 */
- (void)WKShowPaymentViewInVC:(UIViewController *)VC{
    
    CGRect mFrame = [UIApplication sharedApplication].keyWindow.bounds;
    mFrame.origin.y = [[UIScreen mainScreen] bounds].size.height;
    [VC.view addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect mTotleFrame = mFrame;
        mTotleFrame.origin.y = [[UIScreen mainScreen] bounds].origin.y;
        self.frame = mTotleFrame;
    }];
}

/**
 显示方法(显示到当前window)
 */
- (void)WKShowPaymentViewInWindow{
    
    
//    CGRect mFrame = [UIApplication sharedApplication].keyWindow.bounds;
//
//    self.frame = mFrame;
//    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    
    //    [UIView animateWithDuration:0.5 animations:^{
    //        CGRect mTotleFrame = mFrame;
    //        mTotleFrame.origin.y = [[UIScreen mainScreen] bounds].origin.y;
    //        self.mCurrentVC.view.frame = mTotleFrame;
    //        self.frame = self.mCurrentVC.view.frame;
    //    }];
    
    self.mCurrentVC = [UIViewController new];
    self.mCurrentVC.view.backgroundColor = [UIColor clearColor];

    CGRect mFrame = [UIApplication sharedApplication].keyWindow.bounds;
    mFrame.origin.y = kScreenHeight;
    self.mCurrentVC.view.frame = mFrame;
    self.frame = self.mCurrentVC.view.frame;
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect mFrame = self.mCurrentVC.view.frame;
        mFrame.origin.y = 0;
        self.mCurrentVC.view.frame = mFrame;
        self.frame = self.mCurrentVC.view.frame;

        [self.mCurrentVC.view addSubview:self];
        AGWindowView *windowView = [[AGWindowView alloc] initAndAddToKeyWindow];
        [windowView addSubviewAndFillBounds:self.mCurrentVC.view];
        
    } completion:^(BOOL finished) {
        self.mCurrentVC.view.backgroundColor = KRBGColorAlpha(51, 51, 51, 0.69);
    }];
}

- (void)WKHiddenPaymentView:(BOOL)mHidden{
    self.mCurrentVC.view.hidden = mHidden;
    self.hidden = mHidden;
}
- (void)WKRemovePaymentView{
    AGWindowView *windowView = [AGWindowView activeWindowViewContainingView:self.mCurrentVC.view];
    
    [windowView fadeOutAndRemoveFromSuperview:^{
        
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
@end
