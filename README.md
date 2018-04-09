# ChoseGoodsType
之前写过一个仿淘宝商品详情页和加入购物车的demo，有许多朋友下载了，但是那份代码只适用于商品规格只有两种的商品，拓展性不强，可以参考思路，地址（https://github.com/qlyx/AddShoppingCart）
最近又有朋友问到这个demo是否能添加两个以上规格，所以写了这份代码，希望对大家有帮助
使用tableview可以设置多个商品规格，刷新数据源即可
swift版：https://github.com/qlyx/swiftChooseGoodsType

![image](https://github.com/qlyx/ChoseGoodsType/blob/master/chosetype.gif)
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
### 页面布局使用的是SD,提示HUD用的SVProgressHUD,如果使用的是其他HUD,修改JXUIKit下列代码即可
    +(void)showWithString:(NSString *)string
    {
        [SVProgressHUD showWithString:string];
    }
如果觉得对您有帮助请随意打赏一下吧^ _ ^，您的支持是我的无限动力，谢谢

![](https://github.com/qlyx/ChoseGoodsType/blob/master/erweima.png)

谢谢打赏，使用时如有问题可扫下方二维码加我哦

![一起交流，一起进步](https://github.com/qlyx/ChoseGoodsType/blob/master/jiawo.jpg)
