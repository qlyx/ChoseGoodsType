//
//  GoodsTypeModel.h
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/9/25.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import <Foundation/Foundation.h>
//商品规格属性列表
@interface GoodsTypeModel : NSObject
@property(nonatomic, assign)int selectIndex;
@property(nonatomic, copy)NSArray *typeArray;
@property(nonatomic, copy)NSString *typeName;
@end
