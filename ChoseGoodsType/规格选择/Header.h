//
//  Header.h
//  ChoseGoodsType
//
//  Created by 澜海利奥 on 2018/1/29.
//  Copyright © 2018年 江萧. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "JXUIKit.h"
#import "UIView+SDAutoLayout.h"

#import "GoodsModel.h"

#define MJWeakSelf __weak typeof(self) weakSelf = self;

#define kWidth          [UIScreen mainScreen].bounds.size.width
#define kHeight         [UIScreen mainScreen].bounds.size.height
#define kSize(a)        ceil((a)*([UIScreen mainScreen].bounds.size.width/375.0))

#define WhiteColor [UIColor whiteColor]
#define KBtncol [UIColor redColor]//按钮背景颜色
#define KLightGrayLinecol [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#endif /* Header_h */
