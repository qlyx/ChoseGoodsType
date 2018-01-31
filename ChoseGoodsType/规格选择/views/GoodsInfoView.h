//
//  GoodsInfoView.h
//  ChoseGoodsType
//
//  Created by 澜海利奥 on 2018/1/30.
//  Copyright © 2018年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SizeAttributeModel;
@class GoodsModel;
@interface GoodsInfoView : UIView
@property(nonatomic, strong)UIButton *closeButton;
@property(nonatomic, strong)UILabel *promatLabel;
@property (nonatomic, strong)GoodsModel *model;
-(void)initData:(GoodsModel *)model;
-(void)resetData:(SizeAttributeModel *)sizeModel;
@end
