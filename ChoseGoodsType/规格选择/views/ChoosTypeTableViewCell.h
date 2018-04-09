//
//  ChoosTypeTableViewCell.h
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/9/26.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsTypeModel.h"
#define ItemHeight kSize(32)
@interface ChoosTypeTableViewCell : UITableViewCell
@property(nonatomic, strong)GoodsTypeModel *model;
@property (nonatomic, copy) void (^selectButton)(int selectIndex);
-(float)setData:(GoodsTypeModel *)model;
@end
