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
#import "SVProgressHUD.h"
#import "GoodsModel.h"

#define MJWeakSelf __weak typeof(self) weakSelf = self;

#define kWidth          [UIScreen mainScreen].bounds.size.width
#define kHeight         [UIScreen mainScreen].bounds.size.height
#define kSize(a)        ceil((a)*([UIScreen mainScreen].bounds.size.width/375.0))

#define WhiteColor [UIColor whiteColor]
#define KBtncol [UIColor colorWithRed:50/255.0 green:140/255.0 blue:86/255.0 alpha:1]//按钮背景颜色
#define KLightGrayLinecol [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
//是否iPhoneX
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kbottomHeight ((kDevice_Is_iPhoneX==NO)?0:34)
#define kTabbarHeight ((kDevice_Is_iPhoneX==NO)?49.0:83.0)
#endif /* Header_h */
