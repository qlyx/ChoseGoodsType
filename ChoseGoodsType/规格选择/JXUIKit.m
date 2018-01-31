
//
//  JXUIKit.m
//  PartyBuilding
//
//  Created by 主用户 on 2016/11/28.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "JXUIKit.h"
#import "SVProgressHUD.h"
@implementation JXUIKit
+(UIView *)ViewcornerRadius:(float)radius andColor:(UIColor *)color andWidth:(float)width :(UIView *)view
{
    view.layer.cornerRadius = radius;
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = width;
    [view.layer setMasksToBounds:YES];
    return view;
}
+(UILabel *)labelWithBackgroundColor:(UIColor *)backgrountColor textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines fontSize:(float)size font:(UIFont *)font text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    if (backgrountColor) {
        label.backgroundColor = backgrountColor;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (text) {
        label.text = text;
    }
    label.numberOfLines = numberOfLines;
    label.textAlignment = textAlignment;
    if (size>0) {
        label.font = [UIFont systemFontOfSize:size];
    }else
        label.font = font;
    return label;
}

+(UITextField *)textFieldWithBackgroundColor:(UIColor *)backgrountColor textColor:(UIColor *)textColor secureTextEntry:(BOOL)secureTextEntry fontSize:(float)size font:(UIFont *)font text:(NSString *)text placeholder:(NSString *)placeholder textAlignment:(NSTextAlignment)textAlignment
{
    UITextField *textField = [[UITextField alloc] init];
    if (backgrountColor) {
        textField.backgroundColor = backgrountColor;
    }
    if (textColor) {
        textField.textColor = textColor;
    }
    if (text) {
        textField.text = text;
    }
    if (placeholder) {
        textField.placeholder = placeholder;
    }
    if (size>0) {
        textField.font = [UIFont systemFontOfSize:size];
    }else
        textField.font = font;
    textField.secureTextEntry = secureTextEntry;
    textField.textAlignment = textAlignment;
    return textField;
}

+(UIButton *)buttonWithBackgroundColor:(UIColor *)backgrountColor titleColorForNormal:(UIColor *)titleColorForNormal titleForNormal:(NSString *)titleForNormal titleForSelete:(NSString *)titleForSelete titleColorForSelete:(UIColor *)titleColorForSelete  fontSize:(float)size font:(UIFont *)font backgroundImageForNormal:(NSString *)backgroundImageForNormal backgroundImageForSelete:(NSString *)backgroundImageForSelete imageForNormal:(NSString *)imageForNormal imageForSelete:(NSString *)imageForSelete
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (backgrountColor) {
        [button setBackgroundColor:backgrountColor];
    }
    if (titleForNormal) {
        [button setTitle:titleForNormal forState:0];
    }
    if (titleForSelete) {
        [button setTitle:titleForSelete forState:UIControlStateSelected];
    }
    if (titleColorForNormal) {
        [button setTitleColor:titleColorForNormal forState:0];
    }
    if (titleColorForSelete) {
        [button setTitleColor:titleColorForSelete forState:UIControlStateSelected];
    }
    if (size>0) {
        button.titleLabel.font = [UIFont systemFontOfSize:size];
    }else
        button.titleLabel.font = font;
    if (backgroundImageForNormal) {
        [button setBackgroundImage: [UIImage imageNamed:backgroundImageForNormal] forState:0];
    }
    if (backgroundImageForSelete) {
        [button setBackgroundImage: [UIImage imageNamed:backgroundImageForSelete] forState:UIControlStateSelected];
    }
    if (imageForNormal) {
        [button setImage: [UIImage imageNamed:imageForNormal] forState:0];
    }
    if (imageForSelete) {
        [button setImage: [UIImage imageNamed:imageForSelete] forState:UIControlStateSelected];
    }
    return button;
}

+(UIButton *)buttonWithBackgroundColor:(UIColor *)backgrountColor titleColorForNormal:(UIColor *)titleColorForNormal titleForNormal:(NSString *)titleForNormal titleForSelete:(NSString *)titleForSelete titleColorForSelete:(UIColor *)titleColorForSelete  fontSize:(float)size font:(UIFont *)font imageForNormal:(NSString *)imageForNormal imageForSelete:(NSString *)imageForSelete
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   
    if (backgrountColor) {
        [button setBackgroundColor:backgrountColor];
    }
    if (titleForNormal) {
        [button setTitle:titleForNormal forState:0];
    }
    if (titleForSelete) {
        [button setTitle:titleForSelete forState:UIControlStateSelected];
    }
    if (titleColorForNormal) {
        [button setTitleColor:titleColorForNormal forState:0];
    }
    if (titleColorForSelete) {
        [button setTitleColor:titleColorForSelete forState:UIControlStateSelected];
    }
    if (size>0) {
        button.titleLabel.font = [UIFont systemFontOfSize:size];
    }else
        button.titleLabel.font = font;
    if (imageForNormal) {
        [button setImage: [UIImage imageNamed:imageForNormal] forState:0];
    }
    if (imageForSelete) {
        [button setImage: [UIImage imageNamed:imageForSelete] forState:UIControlStateSelected];
    }
    return button;
}


+(UIButton *)buttonWithTitleColorForNormal:(UIColor *)titleColorForNormal titleForNormal:(NSString *)titleForNormal titleForSelete:(NSString *)titleForSelete titleColorForSelete:(UIColor *)titleColorForSelete  fontSize:(float)size font:(UIFont *)font backgroundImageForNormal:(NSString *)backgroundImageForNormal backgroundImageForSelete:(NSString *)backgroundImageForSelete
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (titleForNormal) {
        [button setTitle:titleForNormal forState:0];
    }
    if (titleForSelete) {
        [button setTitle:titleForSelete forState:UIControlStateSelected];
    }
    if (titleColorForNormal) {
        [button setTitleColor:titleColorForNormal forState:0];
    }
    if (titleColorForSelete) {
        [button setTitleColor:titleColorForSelete forState:UIControlStateSelected];
    }
    if (size>0) {
        button.titleLabel.font = [UIFont systemFontOfSize:size];
    }else
        button.titleLabel.font = font;
    if (backgroundImageForNormal) {
        [button setBackgroundImage: [UIImage imageNamed:backgroundImageForNormal] forState:0];
    }
    if (backgroundImageForSelete) {
        [button setBackgroundImage: [UIImage imageNamed:backgroundImageForSelete] forState:UIControlStateSelected];
    }
    return button;
}

+(UIButton *)buttonWithBackgroundColor:(UIColor *)backgrountColor titleColorForNormal:(UIColor *)titleColorForNormal titleForNormal:(NSString *)titleForNormal titleForSelete:(NSString *)titleForSelete titleColorForSelete:(UIColor *)titleColorForSelete  fontSize:(float)size font:(UIFont *)font
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (titleForNormal) {
        [button setTitle:titleForNormal forState:0];
    }
    if (titleForSelete) {
        [button setTitle:titleForSelete forState:UIControlStateSelected];
    }
    if (titleColorForNormal) {
        [button setTitleColor:titleColorForNormal forState:0];
    }
    if (titleColorForSelete) {
        [button setTitleColor:titleColorForSelete forState:UIControlStateSelected];
    }
    if (size>0) {
        button.titleLabel.font = [UIFont systemFontOfSize:size];
    }else
        button.titleLabel.font = font;
    if (backgrountColor) {
        [button setBackgroundColor:backgrountColor];
    }
    return button;
}

+(UIButton *)buttonWithBackgroundImageForNormal:(NSString *)backgroundImageForNormal backgroundImageForSelete:(NSString *)backgroundImageForSelete
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (backgroundImageForNormal) {
        [button setBackgroundImage: [UIImage imageNamed:backgroundImageForNormal] forState:0];
    }
    
    if (backgroundImageForSelete) {
        [button setBackgroundImage: [UIImage imageNamed:backgroundImageForSelete] forState:UIControlStateSelected];
    }
    
    return button;
}

+(UIButton *)buttonWithBackgroundColor:(UIColor *)backgrountColor imageForNormal:(NSString *)imageForNormal imageForSelete:(NSString *)imageForSelete
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (backgrountColor) {
        [button setBackgroundColor:backgrountColor];
    }
    if (imageForNormal) {
         [button setImage: [UIImage imageNamed:imageForNormal] forState:0];
    }
   
    if (imageForSelete) {
        [button setImage: [UIImage imageNamed:imageForSelete] forState:UIControlStateSelected];
    }
    
    return button;
}

+(UIImageView *)imageViewWithBackgroundColor:(UIColor *)backgrountColor userInteractionEnabled:(BOOL)userInteractionEnabled imageName:(NSString *)imageName
{
    UIImageView  *imageView = [[UIImageView alloc] init];
    if (backgrountColor) {
        [imageView setBackgroundColor:backgrountColor];
    }
    imageView.userInteractionEnabled = userInteractionEnabled;
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

+(UIImageView *)imageViewWithBackgroundColor:(UIColor *)backgrountColor userInteractionEnabled:(BOOL)userInteractionEnabled image:(UIImage *)image
{
    UIImageView  *imageView = [[UIImageView alloc] init];
    if (backgrountColor) {
        [imageView setBackgroundColor:backgrountColor];
    }
    imageView.userInteractionEnabled = userInteractionEnabled;
    if (image) {
        imageView.image = image;
    }
    
    return imageView;
}

+(UIImageView *)imageViewWithBackgroundColor:(UIColor *)backgrountColor userInteractionEnabled:(BOOL)userInteractionEnabled imagePath:(NSString *)imagePath
{
    UIImageView  *imageView = [[UIImageView alloc] init];
    if (backgrountColor) {
        [imageView setBackgroundColor:backgrountColor];
    }
    imageView.userInteractionEnabled = userInteractionEnabled;
    //[imageView sd_setImageWithURL:[NSURL URLWithString:imagePath]];
    return imageView;
}

+(UIScrollView *)scrollViewWithBackgroundColor:(UIColor *)backgrountColor scrollEnabled:(BOOL)scrollEnabled contentSize:(CGSize)size pagingEnabled:(BOOL)pagingEnabled showsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator showsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
{
    UIScrollView  *scrollView = [[UIScrollView alloc] init];
    if (backgrountColor) {
        [scrollView setBackgroundColor:backgrountColor];
    }
    scrollView.contentSize = size;
    scrollView.scrollEnabled = scrollEnabled;
    scrollView.pagingEnabled = pagingEnabled;
    scrollView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
    scrollView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
    return scrollView;
}

+(UITableView *)tableViewWithBackgroundColor:(UIColor *)backgrountColor scrollEnabled:(BOOL)scrollEnabled separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.backgroundColor = backgrountColor;
    tableView.scrollEnabled = scrollEnabled;
    tableView.separatorStyle = separatorStyle;
    return tableView;
}

+(UICollectionView *)collectionViewWithBackgroundColor:(UIColor *)backgrountColor scrollEnabled:(BOOL)scrollEnabled itemSize:(CGSize)size scrollDirection:(UICollectionViewScrollDirection)scrollDirection sectionInset:(UIEdgeInsets)sectionInset minimumInteritemSpacing:(float)minimumInteritemSpacing minimumLineSpacing:(float)minimumLineSpacing cellClass:(NSString *)cellClass identifier:(NSString *)identifier
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = size;
    flowLayout.scrollDirection = scrollDirection;
    flowLayout.sectionInset = sectionInset;
    flowLayout.minimumInteritemSpacing = minimumInteritemSpacing;
    flowLayout.minimumLineSpacing = minimumLineSpacing;
    UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionview.backgroundColor = backgrountColor;
    [collectionview registerClass:[cellClass class] forCellWithReuseIdentifier:identifier];
    return collectionview;
}
+(void)showWithString:(NSString *)string
{
    [SVProgressHUD showWithString:string];
}
+(void)showErrorWithStatus:(NSString *)string
{
    
    [SVProgressHUD showErrorWithStatus:string];
}
+(void)showSuccessWithStatus:(NSString *)string
{
    [SVProgressHUD showSuccessWithStatus:string];
}
@end
