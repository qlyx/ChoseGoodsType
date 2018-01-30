//
//  ViewController.m
//  ChoseGoodsType
//
//  Created by 澜海利奥 on 2018/1/29.
//  Copyright © 2018年 江萧. All rights reserved.
//

#import "ViewController.h"
#import "ChoseGoodsTypeAlert.h"
#import "SizeAttributeModel.h"
#import "GoodsTypeModel.h"
#import "Header.h"
@interface ViewController ()
{
    GoodsModel *model;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    model = [[GoodsModel alloc] init];
    model.imageId = @"1";
    model.goodsNo = @"商品名";
    model.title = @"商品标题";
    model.totalStock = @"100";
    //价格信息
    model.price = [[GoodsPriceModel alloc] init];
    model.price.minPrice = @"150";
    model.price.maxPrice = @"158";
    model.price.minOriginalPrice = @"155";
    model.price.maxOriginalPrice = @"160";
    //属性-应该从服务器获取属性列表
    GoodsTypeModel *type = [[GoodsTypeModel alloc] init];
    type.selectIndex = -1;
    type.typeName = @"尺码";
    type.typeArray = @[@"XL",@"XXL"];
    
    GoodsTypeModel *type2 = [[GoodsTypeModel alloc] init];
    type2.selectIndex = -1;
    type2.typeName = @"颜色";
    type2.typeArray = @[@"黑色",@"白色"];
    
    GoodsTypeModel *type3 = [[GoodsTypeModel alloc] init];
    type3.selectIndex = -1;
    type3.typeName = @"日期";
    type3.typeArray = @[@"2016",@"2017",@"2018"];
    model.itemsList = @[type,type2,type3];
    
    //属性组合数组-有时候不同的属性组合价格库存都会有差异，选择完之后要对应修改商品的价格、库存图片等信息，可能是获得商品信息时将属性数组一并返回，也可能属性选择后再请求服务器获得属性组合对应的商品信息，根据自己的实际情况调整
    model.sizeAttribute = [[NSMutableArray alloc] init];
    NSArray *valueArr = @[@"XL、黑色、2016",@"XXL、黑色、2016",@"XL、白色、2016",@"XXL、白色、2016",@"XL、黑色、2017",@"XXL、黑色、2017",@"XL、白色、2017",@"XXL、白色、2017",@"XL、黑色、2018",@"XXL、黑色、2018",@"XL、白色、2018",@"XXL、白色、2018"];
    for (int i = 0; i<valueArr.count; i++) {
        SizeAttributeModel *type = [[SizeAttributeModel alloc] init];
        type.price = @"153";
        type.originalPrice = @"158";
        type.stock = [NSString stringWithFormat:@"%d",arc4random()%20];
        type.goodsNo = model.goodsNo;
        type.value = valueArr[i];
        [model.sizeAttribute addObject:type];
    }
}

- (IBAction)showAlert:(id)sender {

   ChoseGoodsTypeAlert *_alert = [[ChoseGoodsTypeAlert alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) andHeight:kSize (450)];
    _alert.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:_alert];
   
    _alert.selectSize = ^(SizeAttributeModel *sizeModel) {
        //sizeModel 选择的属性模型
        [SVProgressHUD showWithString:[NSString stringWithFormat:@"选择了：%@",sizeModel.value]];
    };
    [_alert initData:model];
    [_alert showView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
