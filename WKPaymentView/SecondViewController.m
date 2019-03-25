//
//  SecondViewController.m
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "WKPaymentViewManager.h"
@interface SecondViewController ()
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"交易view";
}
- (IBAction)mBtnAction:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    
    WKPaymentModel *model = [WKPaymentModel new];
    model.mTitle = @"这是标题";
    
    [[WKPaymentViewManager shareInstance] WKShowPaymentDetail:model addViewController:self andHandle:^(WKPaymentBtnModel mTag, WKPaymentType mType) {
        if (mTag == WKPaymentSelectPayMethodModel) {

            [[WKPaymentViewManager shareInstance] WKHiddenPaymentView:YES];
            ThirdViewController *vc = [ThirdViewController new];

            vc.mBackBlock = ^{
                [[WKPaymentViewManager shareInstance] WKHiddenPaymentView:NO];
            };

            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    }];
    
    //    [[WKPaymentViewManager shareInstance] WKShowCrosBorder:model addViewController:self andHandle:^(WKPaymentBtnModel mTag, WKPaymentType mType) {
    //
    //    }];
    
    //    [[WKPaymentViewManager shareInstance] WKShowPaymentPIN:model addViewController:self andHandle:^(WKPaymentBtnModel mTag, WKPaymentType mType) {
    //
    //    } andPinHandle:^(NSString * _Nonnull mPIN) {
    //
    //    }];
    
//    [[WKPaymentViewManager shareInstance] WKShowPaymentLoading:ALLoadingViewResultTypeLoading andMessage:@"这是消息" andModel:model addViewController:self andHandle:^(WKPaymentBtnModel mTag, WKPaymentType mType) {
//        
//    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
