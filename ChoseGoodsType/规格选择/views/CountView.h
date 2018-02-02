//
//  CountView.h
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/9/26.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountView : UIView
@property(nonatomic, strong)UILabel *label;
@property(nonatomic, strong)UIButton *reduceButton;//减
@property(nonatomic, strong)UITextField *countTextField;//输入框
@property(nonatomic, strong)UIButton *addButton;//加
@property(nonatomic, strong)UIButton *textFieldDownButton;
@end
