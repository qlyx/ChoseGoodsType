//
//  GoodsPriceModel.h
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/10/13.
//  Copyright © 2017年 新媒科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsPriceModel : NSObject
@property(nonatomic, copy)NSString *minPrice;//现价
@property(nonatomic, copy)NSString *maxPrice;
@property(nonatomic, copy)NSString *minOriginalPrice;//原价
@property(nonatomic, copy)NSString *maxOriginalPrice;
@end
