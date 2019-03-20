//
//  WKCustomCodeView.m
//  RazerPay
//
//  Created by 王钶 on 2018/9/22.
//  Copyright © 2018年 王钶. All rights reserved.
//

#import "WKCustomCodeView.h"

@implementation WKCustomCodeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (WKCustomCodeView *)shareViewWithType:(WKKeyBoradType)mType{
//    WKCustomCodeView *view = [WKTool WKLoadNibName:@"WKCustomCodeView"];
    WKCustomCodeView *view = [[[NSBundle mainBundle] loadNibNamed:@"WKCustomCodeView" owner:self options:nil] objectAtIndex:0];
    view.mType = mType;
    view.mDisPlayType = WKDisPlayNormalType;
    
    view.mImg1.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
    view.mImg2.image = view.mImg3.image = view.mImg4.image = view.mImg5.image = view.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
    view.mTextFiled.delegate = view;
    [view.mTextFiled addTarget:view action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    return view;
}
+ (WKCustomCodeView *)sharePayViewWithType:(WKKeyBoradType)mType{
//    WKCustomCodeView *view = [WKTool WKLoadNibName:@"WKCustomPayCodeView"];
    WKCustomCodeView *view = [[[NSBundle mainBundle] loadNibNamed:@"WKCustomPayCodeView" owner:self options:nil] objectAtIndex:0];

    view.mType = mType;
    view.mDisPlayType = WKDisPlayPayViewType
    ;
    view.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_green"];
    
    view.mImg2.image = view.mImg3.image = view.mImg4.image = view.mImg5.image = [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
    
    view.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_gray_bgk"];
    
    view.mTextFiled.delegate = view;
    [view.mTextFiled addTarget:view action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    return view;
}

-(void)textFieldDidChange :(UITextField *)textField{
    if (textField.text.length<=0) {
        if (self.mType == WKCustomCodeTypeSecurety) {
            self.mPoint1.image = self.mPoint2.image = self.mPoint3.image = self.mPoint4.image = self.mPoint5.image = self.mPoint6.image = [UIImage yh_imageNamed:@""];

        }else{
            self.mLb1.text = self.mLb2.text = self.mLb3.text = self.mLb4.text = self.mLb5.text = self.mLb6.text = @"";

        }
        if (self.mDisPlayType == WKDisPlayNormalType) {
            self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
            
            self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg5.image = self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
        }else{
            
            self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_green"];
            
            self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg5.image = [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
            
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_gray_bgk"];


        }


    }else if (textField.text.length == 1){
        
        if (self.mType == WKCustomCodeTypeSecurety) {
            
            self.mPoint1.image = [UIImage yh_imageNamed:@"pdf_pass_code_securety_green"];
            
             self.mPoint2.image = self.mPoint3.image = self.mPoint4.image = self.mPoint5.image = self.mPoint6.image = [UIImage yh_imageNamed:@""];
            
        }else{
            self.mLb1.text = [textField.text substringFromIndex:textField.text.length-1];

             self.mLb2.text = self.mLb3.text = self.mLb4.text = self.mLb5.text = self.mLb6.text = @"";

        }
        if (self.mDisPlayType == WKDisPlayNormalType) {
            self.mImg2.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
            self.mImg1.image = self.mImg3.image = self.mImg4.image = self.mImg5.image = self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
        }else{
            self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_gray_bgk"];

            self.mImg2.image = [UIImage yh_imageNamed:@"pdf_pay_code_green_bgk"];
            
            self.mImg3.image = self.mImg4.image = self.mImg5.image =  [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
            
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_gray_bgk"];
            
        }
   

    }else if (textField.text.length == 2){
        if (self.mType == WKCustomCodeTypeSecurety) {
            
            self.mPoint2.image = [UIImage yh_imageNamed:@"pdf_pass_code_securety_green"];
            self.mPoint3.image = self.mPoint4.image = self.mPoint5.image = self.mPoint6.image = [UIImage yh_imageNamed:@""];
            
        }else{
            self.mLb2.text = [textField.text substringFromIndex:textField.text.length-1];
            self.mLb3.text = self.mLb4.text = self.mLb5.text = self.mLb6.text = @"";

        }
        if (self.mDisPlayType == WKDisPlayNormalType) {
            self.mImg3.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
            self.mImg1.image = self.mImg2.image = self.mImg4.image = self.mImg5.image = self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
        }else{
            self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_gray_bgk"];
            
            self.mImg3.image = [UIImage yh_imageNamed:@"pdf_pay_code_green_bgk"];
            
            self.mImg2.image = self.mImg4.image = self.mImg5.image =  [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
            
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_gray_bgk"];
        }
 
    }else if (textField.text.length == 3){
        if (self.mType == WKCustomCodeTypeSecurety) {
            
            self.mPoint3.image = [UIImage yh_imageNamed:@"pdf_pass_code_securety_green"];
            self.mPoint4.image = self.mPoint5.image = self.mPoint6.image = [UIImage yh_imageNamed:@""];
            
        }else{
            self.mLb3.text = [textField.text substringFromIndex:textField.text.length-1];
             self.mLb4.text = self.mLb5.text = self.mLb6.text = @"";

        }
        if (self.mDisPlayType == WKDisPlayNormalType) {
            self.mImg4.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
            self.mImg1.image = self.mImg2.image = self.mImg3.image = self.mImg5.image = self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
        }else{
            self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_gray_bgk"];
            
            self.mImg4.image = [UIImage yh_imageNamed:@"pdf_pay_code_green_bgk"];
            
            self.mImg2.image = self.mImg3.image = self.mImg5.image =  [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
            
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_gray_bgk"];
        }

    }else if (textField.text.length == 4){
        if (self.mType == WKCustomCodeTypeSecurety) {
            
            self.mPoint4.image = [UIImage yh_imageNamed:@"pdf_pass_code_securety_green"];
            self.mPoint5.image = self.mPoint6.image = [UIImage yh_imageNamed:@""];
            
        }else{
            self.mLb4.text = [textField.text substringFromIndex:textField.text.length-1];
            self.mLb5.text = self.mLb6.text = @"";

        }
        if (self.mDisPlayType == WKDisPlayNormalType) {
            self.mImg5.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
            self.mImg1.image = self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
        }else{
            self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_gray_bgk"];
            
            self.mImg5.image = [UIImage yh_imageNamed:@"pdf_pay_code_green_bgk"];
            
            self.mImg2.image = self.mImg3.image = self.mImg4.image =  [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
            
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_gray_bgk"];
        }

    }else if (textField.text.length == 5){
        if (self.mType == WKCustomCodeTypeSecurety) {
            
            self.mPoint5.image = [UIImage yh_imageNamed:@"pdf_pass_code_securety_green"];
            self.mPoint6.image = [UIImage yh_imageNamed:@""];
            
        }else{
            self.mLb5.text = [textField.text substringFromIndex:textField.text.length-1];
            self.mLb6.text = @"";

        }
        if (self.mDisPlayType == WKDisPlayNormalType) {
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
            self.mImg1.image = self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg5.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
        }else{
            
            self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_gray_bgk"];
            
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_bgk_green"];
            
            self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg5.image =  [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
            
        }

    }else if (textField.text.length == 6){
        if (self.mType == WKCustomCodeTypeSecurety) {
            
            self.mPoint6.image = [UIImage yh_imageNamed:@"pdf_pass_code_securety_green"];
            
        }else{
            self.mLb6.text = [textField.text substringFromIndex:textField.text.length-1];

        }
        if (self.mDisPlayType == WKDisPlayNormalType) {
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
            self.mImg1.image = self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg5.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
        }else{
            self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_gray_bgk"];
            
            self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_bgk_green"];
            
            self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg5.image =  [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
        }

    }
    if (self.mTextBlock) {
        self.mTextBlock(textField.text);
    }
}
///限制密码输入长度
#define PASS_MAXLENGTH 6

#pragma mark **----键盘代理方法
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    NSString *new = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSInteger res;
    if (textField.tag==0) {
        res= PASS_MAXLENGTH-[new length];
        
    }
    else {
        res= PASS_MAXLENGTH-[new length];
        
    }
    if(res >= 0){
        return YES;
    }
    else{
        NSRange rg = {0,[string length]+res};
        if (rg.length>0) {
            NSString *s = [string substringWithRange:rg];
            [textField setText:[textField.text stringByReplacingCharactersInRange:range withString:s]];
        }
        return NO;
    }
    
}
- (void)WKShowKeyborad{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mTextFiled becomeFirstResponder];
//    });
}

- (void)WKHideKeyborad{
    [self.mTextFiled resignFirstResponder];
    [self WKClearnText];
}
/**
 清空输入内容
 */
- (void)WKClearnText{
    self.mTextFiled.text = @"";
    self.mTextBlock(@"");
    
//    self.mLb1.text = self.mLb2.text = self.mLb3.text = self.mLb4.text = self.mLb5.text = self.mLb6.text = @"";
//    self.mPoint1.image = self.mPoint2.image = self.mPoint3.image = self.mPoint4.image = self.mPoint5.image = self.mPoint6.image = [UIImage yh_imageNamed:@""];

    
    if (self.mType == WKCustomCodeTypeSecurety) {
        self.mPoint1.image = self.mPoint2.image = self.mPoint3.image = self.mPoint4.image = self.mPoint5.image = self.mPoint6.image = [UIImage yh_imageNamed:@""];
    }else{
        self.mLb1.text = self.mLb2.text = self.mLb3.text = self.mLb4.text = self.mLb5.text = self.mLb6.text = @"";
    }
    
    if (self.mDisPlayType == WKDisPlayNormalType) {
        self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pass_code_select"];
        
        self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg5.image = self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pass_code_unselect"];
    }else{
        self.mImg1.image = [UIImage yh_imageNamed:@"pdf_pay_code_first_green"];
        self.mImg2.image = self.mImg3.image = self.mImg4.image = self.mImg5.image = [UIImage yh_imageNamed:@"pdf_pay_code_gray_bgk"];
        self.mImg6.image = [UIImage yh_imageNamed:@"pdf_pay_code_last_gray_bgk"];

    }
        
}
@end
