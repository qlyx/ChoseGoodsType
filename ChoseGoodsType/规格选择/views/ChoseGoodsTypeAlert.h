//
//  ChoseGoodsTypeAlert.h
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/9/26.
//  Copyright © 2017年 新媒科技. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SizeAttributeModel.h"
@class GoodsModel;
@interface ChoseGoodsTypeAlert : UIView<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property (nonatomic, strong)GoodsModel *model;
@property (nonatomic, copy)void (^selectSize)(SizeAttributeModel *sizeModel);
-(void)hideView;
-(void)showView;
-(void)initData:(GoodsModel *)model;
-(instancetype)initWithFrame:(CGRect)frame andHeight:(float)height;
@end
