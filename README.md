# ChoseGoodsType
![image](https://github.com/qlyx/ChoseGoodsType/2018-01-30\ 14_34_42.gif)
## 下面代码创建即可
    ChoseGoodsTypeAlert *_alert = [[ChoseGoodsTypeAlert alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) andHeight:kSize (450)];
    _alert.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:_alert];

    _alert.selectSize = ^(SizeAttributeModel *sizeModel) {
    //sizeModel 选择的属性模型
    [SVProgressHUD showWithString:[NSString stringWithFormat:@"选择了：%@",sizeModel.value]];
    };
    [_alert initData:model];
    [_alert showView];

### 页面布局使用的是SD,提示HUD用的SVProgressHUD
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
