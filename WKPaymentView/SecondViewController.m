//
//  SecondViewController.m
//  WKPaymentView
//
//  Created by apple on 13/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SecondViewController.h"
#import "WKPaymentView.h"
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
    
    self.mPayView = [WKPaymentView initView];
    [self.mPayView loadDetail];

//    [self.mPayView WKShowPaymentViewInVC:self];
    [self.mPayView WKShowPaymentViewInWindow];
    
//    [self.mPayView WKLeftToMid];
    
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
