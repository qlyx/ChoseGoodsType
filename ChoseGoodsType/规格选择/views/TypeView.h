//
//  TypeView.h
//  AddShoppingCart
//
//  Created by 主用户 on 16/3/23.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TypeView : UIView
@property(nonatomic, assign)float height;
@property (nonatomic, copy) void (^selectButton)(int selectIndex);
-(void)initWithDatasource:(NSArray *)arr typeName:(NSString *)typeName selecteIndex:(int)index;
@end
