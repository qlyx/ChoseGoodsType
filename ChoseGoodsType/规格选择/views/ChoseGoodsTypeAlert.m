
//
//  ChoseGoodsTypeAlert.m
//  MeiXiangDao_iOS
//
//  Created by 澜海利奥 on 2017/9/26.
//  Copyright © 2017年 江萧. All rights reserved.
//

#import "ChoseGoodsTypeAlert.h"
#import "ChoosTypeTableViewCell.h"
#import "GoodsTypeModel.h"
#import "Header.h"
#import "GoodsInfoView.h"
#import "CountView.h"
@implementation ChoseGoodsTypeAlert
{
    UIButton *sureButton;
    UIView *view;
    UIView *bgView;
    SizeAttributeModel *sizeModel;
    GoodsInfoView *goodsInfo;
    CountView *countView;
}

-(instancetype)initWithFrame:(CGRect)frame andHeight:(float)height {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //半透明view
        view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = RGBACOLOR(0, 0, 0, 0.4);
        [self addSubview:view];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        [view addGestureRecognizer:tap];
        //白色底view
        bgView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeight, kWidth, height)];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.userInteractionEnabled = YES;
        [self addSubview:bgView];
        
        //商品信息
        goodsInfo = [[GoodsInfoView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kSize(110))];
        [goodsInfo.closeButton addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:goodsInfo];
        
        sureButton = [JXUIKit buttonWithBackgroundColor:KBtncol titleColorForNormal:WhiteColor titleForNormal:@"确定" titleForSelete:nil titleColorForSelete:nil fontSize:18 font:nil];
        [sureButton addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:sureButton];
        //kbottomHeight为了适配iphonex，不让按钮显示在x底部圆弧范围内
        sureButton.sd_layout.leftSpaceToView(bgView, 0).rightSpaceToView(bgView, 0).bottomSpaceToView(bgView, 0).heightIs(49);
        [bgView addSubview:self.tableview];
        
        self.tableview.sd_layout.leftSpaceToView(bgView, 0).rightSpaceToView(bgView, 0).topSpaceToView(goodsInfo, 0).bottomSpaceToView(sureButton, 0);
    }
    return self;
}
#pragma mark - methods
-(void)hideView
{
    [self tfresignFirstResponder];
    [UIView animateWithDuration:0.25 animations:^
     {
         bgView.centerY = bgView.centerY+CGRectGetHeight(bgView.frame);
         
     } completion:^(BOOL fin){
         [self removeFromSuperview];
         
     }];
    
}
//
-(void)showView
{
    self.alpha = 1;
    [UIView animateWithDuration:0.25 animations:^
     {
         bgView.centerY = bgView.centerY-CGRectGetHeight(bgView.frame);
         
     } completion:^(BOOL fin){}];
}
-(void)initData:(GoodsModel *)model
{
    _model = model;
    [goodsInfo initData:model];
    [_dataSource removeAllObjects];
    //传入数据源创建多个属性
    [_dataSource addObjectsFromArray:model.itemsList];
    //此方法必须在_dataSource赋值后方可调用
    [self reloadGoodsInfo];
    [self.tableview reloadData];
}
-(void)reloadGoodsInfo
{
    for (GoodsTypeModel *model in _dataSource) {
        if (model.selectIndex<0) {
            goodsInfo.promatLabel.text =[NSString stringWithFormat:@"请选择%@",model.typeName];
            break;
        }
    }
    NSString *str = [self getSizeStr];
    NSLog(@"用户选择的属性是：%@",str);
    sizeModel = nil;
    //遍历属性组合列表找出符合的属性，修改价格和库存等信息
    for (SizeAttributeModel *model in _model.sizeAttribute) {
        if ([model.value isEqualToString:str]) {
            sizeModel = model;
            if ([countView.countTextField.text intValue]>[sizeModel.stock intValue]) {
                countView.countTextField.text = [NSString stringWithFormat:@"%d",[sizeModel.stock intValue]];
            }else if ([countView.countTextField.text intValue]<[sizeModel.stock intValue])
            {
                if ([countView.countTextField.text intValue] == 0) {
                    countView.countTextField.text = @"1";
                }
            }
            goodsInfo.promatLabel.text = [NSString stringWithFormat:@"已选%@",model.value];
            [goodsInfo resetData:model];
            return;
        }
    }
    //没找到匹配的，显示默认数据
    [goodsInfo initData:_model];
}
//点击确定
-(void)sure
{
    for (GoodsTypeModel *model in _dataSource) {
        if (model.selectIndex<0) {
            [JXUIKit showErrorWithStatus:[NSString stringWithFormat:@"请选择%@",model.typeName]];
            return;
        }
    }
    if (_dataSource.count == 0) {
        //该商品无规格
        [JXUIKit showErrorWithStatus:@"该商品无规格"];
        [self hideView];
        return;
    }
    //判断库存
    if ([sizeModel.stock intValue]>0) {
        if (self.selectSize) {
            sizeModel.count = countView.countTextField.text;
            self.selectSize(sizeModel);
        }
        [self hideView];
    }else
    {
        [JXUIKit showErrorWithStatus:@"该规格商品暂无库存无法加入购物车"];
    }
    
}
-(NSString *)getSizeStr
{
    //拼接属性字符串
    NSString *str=@"";
    for (GoodsTypeModel *model in _dataSource) {
        if (model.selectIndex>=0) {
            if (str.length == 0) {
                str = model.typeArray[model.selectIndex];
            }else
                str = [NSString stringWithFormat:@"%@、%@",str,model.typeArray[model.selectIndex]];
        }
    }
    return str;
}
#pragma mark-数量加减
-(void)add
{
    int count =[countView.countTextField.text intValue];
    //如果有选好的属性就根据选好的属性库存判断，没选择就按总库存判断，数量不能超过库存
    if (sizeModel) {
        if (count <[sizeModel.stock intValue]) {
            countView.countTextField.text = [NSString stringWithFormat:@"%d",count+1];
        }
    }else
    {
        if (count < [_model.totalStock intValue]) {
            countView.countTextField.text = [NSString stringWithFormat:@"%d",count+1];
            
        }
    }

}
-(void)reduce
{
    int count =[countView.countTextField.text intValue];
    if (count > 1) {

        countView.countTextField.text = [NSString stringWithFormat:@"%d",count-1];
       
    }
}
#pragma mark-tf
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.tableview.contentOffset = CGPointMake(0, countView.frame.origin.y);
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    int count =[countView.countTextField.text intValue];
    if (sizeModel) {
        if (count >[sizeModel.stock intValue]) {
            [JXUIKit showWithString:@"数量超出库存"];
            countView.countTextField.text = sizeModel.stock;
        }
    }else
    {
        if (count > [_model.totalStock intValue]) {
            [JXUIKit showWithString:@"数量超出库存"];
            countView.countTextField.text = _model.totalStock;
            
        }
    }
}
-(void)tfresignFirstResponder
{
    self.tableview.contentOffset = CGPointMake(0, 0);
    [countView.countTextField resignFirstResponder];
}
#pragma mark - tavdelegete
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ChoosTypeTableViewCell";
    ChoosTypeTableViewCell *cell = [[ChoosTypeTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    GoodsTypeModel *model = _dataSource[indexPath.row];
    tableView.rowHeight=[cell setData:model];
    MJWeakSelf
    cell.selectButton = ^(int selectIndex) {
        [weakSelf reloadGoodsInfo];
    };
    return cell;
    
}

-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
        _tableview.sectionHeaderHeight = 0;
        _tableview.backgroundColor = WhiteColor;
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _dataSource = [[NSMutableArray alloc] init];
        countView = [[CountView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kSize(50))];
        countView.countTextField.delegate = self;
        [countView.addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
        [countView.reduceButton addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
        [countView.textFieldDownButton addTarget:self action:@selector(tfresignFirstResponder) forControlEvents:UIControlEventTouchUpInside];
        _tableview.tableFooterView = countView;
        
        
    }
    return _tableview;
}
-(void)dealloc
{
    NSLog(@"dddddd");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
