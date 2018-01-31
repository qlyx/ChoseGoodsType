//
//  SizeAttributeModel.h
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/10/18.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import <Foundation/Foundation.h>
//商品各规格商品信息
@interface SizeAttributeModel : NSObject
@property(nonatomic, copy)NSString *sizeid;//属性组合id
@property(nonatomic, copy)NSString *goodsNo;//商品编号
@property(nonatomic, copy)NSString *value;//属性组合
@property(nonatomic, copy)NSString *price;//现价
@property(nonatomic, copy)NSString *originalPrice;//原价
@property(nonatomic, copy)NSString *stock;//库存

@property(nonatomic, copy)NSString *count;//数量
@property(nonatomic, copy)NSString *imageId;//可能规格不同商品图片也不同

@end
