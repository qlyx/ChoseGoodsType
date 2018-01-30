//
//  ChoosTypeTableViewCell.h
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/9/26.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsTypeModel.h"
#import "TypeView.h"
#define ItemHeight kSize(32)
@interface ChoosTypeTableViewCell : UITableViewCell
@property(nonatomic, strong)TypeView *typeView;
@property(nonatomic, strong)GoodsTypeModel *model;
-(float)setData:(GoodsTypeModel *)model;
@end
