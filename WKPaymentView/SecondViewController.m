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
    [self.mPayView loadDetail];

    [self.mPayView WKShowPaymentViewInVC:self];
    self.mPayView.WKPayDetailViewHandle = ^(NSInteger mTag) {
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
        [weakSelf.mPayView WKLeftToMid];

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
