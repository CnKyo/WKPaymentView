//
//  WKPaymentModel.h
//  WKPaymentView
//
//  Created by apple on 16/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface WKPaymentModel : NSObject

@property (strong,nonatomic) NSString *mTitle;
@property (strong,nonatomic) NSString *mLeftImage;
@property (strong,nonatomic) UIColor *mGoPayBgkColor;
@property (strong,nonatomic) NSString *mCategory;

/**
 类型
 */
@property (assign,nonatomic) NSInteger mType;

@end

@interface WKPaymentMethodModel : NSObject

@property (strong,nonatomic) NSString *mTitle;
@property (assign,nonatomic) BOOL selected;

@end

NS_ASSUME_NONNULL_END
