//
//  GoodsModel.h
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/10/10.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsPriceModel.h"

@interface GoodsModel : NSObject
@property(nonatomic, copy)NSString *goodsNo;//编号
@property(nonatomic, copy)NSString *title;//商品标题
@property(nonatomic, copy)NSString *imageId;//缩略图id
@property(nonatomic, copy)NSString *totalStock;//总库存

@property(nonatomic, copy)NSArray *itemsList;//属性列表
@property(nonatomic, copy)NSArray *banners;//商品轮播图
@property(nonatomic, strong)NSMutableArray *sizeAttribute;//属性组合列表
@property(nonatomic, strong)GoodsPriceModel *price;//价格信息-一般商品不同属性组合价格不同，会有个价格范围


@end
