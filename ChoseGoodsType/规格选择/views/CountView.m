//
//  CountView.m
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/9/26.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import "CountView.h"
#import "Header.h"
@implementation CountView
@synthesize addButton,reduceButton,countTextField,label;
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(kSize(15), kSize(10), kSize(100), kSize(30))];
        label.text = @"购买数量";
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        
        addButton= [JXUIKit buttonWithBackgroundColor:WhiteColor titleColorForNormal:[UIColor blackColor] titleForNormal:@"+" titleForSelete:nil titleColorForSelete:nil fontSize:20 font:nil];
        [JXUIKit ViewcornerRadius:4 andColor:KLightGrayLinecol andWidth:1 :addButton];
        [self addSubview:addButton];
        addButton.sd_layout.rightSpaceToView(self, kSize(15)).widthIs(kSize(30)).heightIs(kSize(30)).centerYEqualToView(self);
        
        countTextField = [JXUIKit textFieldWithBackgroundColor:WhiteColor textColor:[UIColor blackColor] secureTextEntry:NO fontSize:15 font:nil text:@"1" placeholder:nil textAlignment:NSTextAlignmentCenter];
        countTextField.keyboardType = UIKeyboardTypeNumberPad;
        [JXUIKit ViewcornerRadius:4 andColor:KLightGrayLinecol andWidth:1 :countTextField];
        [self addSubview:countTextField];
        countTextField.sd_layout.rightSpaceToView(addButton, kSize(5)).widthIs(kSize(60)).heightIs(kSize(30)).centerYEqualToView(self);
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 40)];
        view.backgroundColor = WhiteColor;
        
       _textFieldDownButton= [JXUIKit buttonWithBackgroundColor:WhiteColor imageForNormal:@"jiantou_down" imageForSelete:nil];
        _textFieldDownButton.frame = CGRectMake(kWidth-50, 0, 50, 40);
        [view addSubview:_textFieldDownButton];
        countTextField.inputAccessoryView = view;
        
        reduceButton= [JXUIKit buttonWithBackgroundColor:WhiteColor titleColorForNormal:[UIColor blackColor] titleForNormal:@"-" titleForSelete:nil titleColorForSelete:nil fontSize:20 font:nil];
        [JXUIKit ViewcornerRadius:4 andColor:KLightGrayLinecol andWidth:1 :reduceButton];
        [self addSubview:reduceButton];
        reduceButton.sd_layout.rightSpaceToView(countTextField, kSize(5)).widthIs(kSize(30)).heightIs(kSize(30)).centerYEqualToView(self);
      
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
