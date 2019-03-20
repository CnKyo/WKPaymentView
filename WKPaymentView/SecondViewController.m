//
//  SecondViewController.m
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SecondViewController.h"
#import "WKPaymentView.h"
#import "ThirdViewController.h"
@interface SecondViewController ()
@property (strong,nonatomic) WKPaymentView *mPayView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"交易view";
}
- (IBAction)mBtnAction:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    
    self.mPayView = [WKPaymentView initView];
    [self.mPayView WKShowPaymentViewInVC:self];

    WKPaymentModel *model = [WKPaymentModel new];
    model.mTitle = @"这是标题";
    [self.mPayView WKShowPaymentDetail:model];

    self.mPayView.WKPayDetailViewHandle = ^(WKPaymentBtnModel mTag) {
        switch (mTag) {
            case WKPaymentGoPayModel:
            {
//                [weakSelf.mPayView WKRemovePaymentView];
                [weakSelf.mPayView WKShowPaymentPIN:nil];

            }
                break;
            case WKPaymentLeftImageModel:
            {
                [weakSelf.mPayView WKRemovePaymentView];
            }
                break;
            case WKPaymentSelectPayMethodModel:
            {
                [weakSelf.mPayView WKShowPaymentMethod:nil];

            }
                break;
            default:
                break;
        }
//        [weakSelf.mPayView WKHiddenPaymentView:YES];
//
//        ThirdViewController *vc = [ThirdViewController new];
//
//        vc.mBackBlock = ^{
//            [weakSelf.mPayView WKHiddenPaymentView:NO];
////            [weakSelf.mPayView WKRemovePaymentView];
//        };
//
//        [weakSelf.navigationController pushViewController:vc animated:YES];
        

    };
    self.mPayView.WKPayMethodViewHandle = ^(WKPaymentBtnModel mTag,WKPaymentMethodModel *mCurrentMethod) {
        switch (mTag) {
            case WKPaymentGoPayModel:
            {
//                [weakSelf.mPayView WKRemovePaymentView];
                [weakSelf.mPayView WKShowPaymentDetail:nil];

            }
                break;
            case WKPaymentLeftImageModel:
            {
                [weakSelf.mPayView WKShowPaymentDetail:nil];
            }
                break;
            default:
                break;
        }
    };
    
    self.mPayView.WKPayPINCodeViewHandle = ^(NSString * _Nonnull mPINCode) {
        NSLog(@"you are input:%@",mPINCode);
        [weakSelf.mPayView WKShowPaymentLoading:ALLoadingViewResultTypeLoading andMessage:@"Verifying Payment…"];
    };

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
