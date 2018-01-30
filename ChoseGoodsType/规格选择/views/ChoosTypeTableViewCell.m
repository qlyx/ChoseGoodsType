
//
//  ChoosTypeTableViewCell.m
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/9/26.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import "ChoosTypeTableViewCell.h"
#import "Header.h"
@implementation ChoosTypeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.backgroundColor = WhiteColor;
       
    }
    return self;
}
-(float)setData:(GoodsTypeModel *)model
{
    _model = model;
    if (!_typeView) {
        _typeView = [[TypeView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 50) andDatasource:model.typeArray typeName:model.typeName selecteIndex:model.selectIndex];
        [self addSubview:_typeView];
        _typeView.frame = CGRectMake(0, 0, kWidth, _typeView.height);
    }
    return _typeView.height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
