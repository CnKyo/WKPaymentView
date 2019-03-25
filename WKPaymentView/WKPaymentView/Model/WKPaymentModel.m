//
//  WKPaymentModel.m
//  WKPaymentView
//
//  Created by 王钶 on 16/03/2019.
//  Copyright © 2019 王钶. All rights reserved.
//

#import "WKPaymentModel.h"


@implementation WKPaymentModel
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.mTitle forKey:@"mTitle"];
    ///
    [aCoder encodeObject:self.mLeftImage forKey:@"mLeftImage"];
    [aCoder encodeObject:self.mGoPayBgkColor forKey:@"mGoPayBgkColor"];
    ///
    [aCoder encodeObject:self.mAmount forKey:@"mAmount"];
    [aCoder encodeObject:self.mCategoryLb forKey:@"mCategoryLb"];
    ///
    [aCoder encodeObject:self.mCategory forKey:@"mCategory"];
    [aCoder encodeObject:self.mMerchantLb forKey:@"mMerchantLb"];
    ///
    [aCoder encodeObject:self.mMerchant forKey:@"mMerchant"];
    [aCoder encodeObject:self.mMethodLb forKey:@"mMethodLb"];
    ///
    [aCoder encodeObject:self.mMethod forKey:@"mMethod"];
    [aCoder encodeObject:self.mCouponLb forKey:@"mCouponLb"];
    ///
    [aCoder encodeObject:self.mCoupon forKey:@"mCoupon"];
    [aCoder encodeObject:self.mRateChangeLb forKey:@"mRateChangeLb"];
    ///
    [aCoder encodeObject:self.mRateChange forKey:@"mRateChange"];
    [aCoder encodeObject:self.mForgetPINTitle forKey:@"mForgetPINTitle"];
    ///
    [aCoder encodeObject:self.mSetPINSubTitle forKey:@"mSetPINSubTitle"];
    [aCoder encodeObject:self.mSetPINDetail forKey:@"mSetPINDetail"];
    
    [aCoder encodeObject:[NSString stringWithFormat:@"%ld",self.mType] forKey:@"mType"];

}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        
        self.mTitle = [aDecoder decodeObjectForKey:@"mTitle"];
        ///
        self.mLeftImage = [aDecoder decodeObjectForKey:@"mLeftImage"];
        self.mGoPayBgkColor = [aDecoder decodeObjectForKey:@"mGoPayBgkColor"];
        ///
        self.mAmount = [aDecoder decodeObjectForKey:@"mAmount"];
        self.mCategoryLb = [aDecoder decodeObjectForKey:@"mCategory"];
        ///
        self.mCategory = [aDecoder decodeObjectForKey:@"mCategory"];
        self.mMerchantLb = [aDecoder decodeObjectForKey:@"mMerchantLb"];
        ///
        self.mMerchant = [aDecoder decodeObjectForKey:@"mMerchant"];
        self.mMethodLb = [aDecoder decodeObjectForKey:@"mMethodLb"];
        ///
        self.mMethod = [aDecoder decodeObjectForKey:@"mMethod"];
        self.mCouponLb = [aDecoder decodeObjectForKey:@"mCouponLb"];
        ///
        self.mCoupon = [aDecoder decodeObjectForKey:@"mCoupon"];
        self.mRateChangeLb = [aDecoder decodeObjectForKey:@"mRateChangeLb"];
        ///
        self.mRateChange = [aDecoder decodeObjectForKey:@"mRateChange"];
        self.mForgetPINTitle = [aDecoder decodeObjectForKey:@"mForgetPINTitle"];
        ///
        self.mSetPINSubTitle = [aDecoder decodeObjectForKey:@"mSetPINSubTitle"];
        self.mSetPINDetail = [aDecoder decodeObjectForKey:@"mSetPINDetail"];
        
        self.mType = [[aDecoder decodeObjectForKey:@"mType"] integerValue];

    }
    return self;
}
+ (BOOL)supportsSecureCoding {
    return YES;
}
@end

@implementation WKPaymentMethodModel

@end

