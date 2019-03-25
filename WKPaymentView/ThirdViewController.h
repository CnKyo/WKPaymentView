//
//  ThirdViewController.h
//  WKPaymentView
//
//  Created by 王钶 on 15/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ThirdViewControllerBackBlock)();

@interface ThirdViewController : UIViewController

@property (copy,nonatomic) ThirdViewControllerBackBlock mBackBlock;

@end

NS_ASSUME_NONNULL_END
