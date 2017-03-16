//
//  YFTableViewDelAllCell.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/1.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFTableViewDelAllCell.h"

@implementation YFTableViewDelAllCell


+ (instancetype)cellWithtableView:(UITableView *)tableView {
    
    static NSString *ID = @"YFChargingPileCell";
    YFTableViewDelAllCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YFTableViewDelAllCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor clearColor];
//    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}

#pragma mark - 初始化子控件
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加子控件
        [self makeView];
    }
    return self;
}

- (void)makeView {
    
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    btn1.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 25, 50, 20)];
    btn2.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(300, 0, 20, 20)];
    btn3.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:btn3];
//
    self.frame = CGRectMake(0, 0, YFScreen.width, 130);
    
}

//- (void)layoutSubviews {
//
//    [super layoutSubviews];
//    if (self.selected) {
//        self.imageView.backgroundColor = [UIColor clearColor];
//    }
//}

//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    if (self.selected)
//    {
//        self.cellBackImageView.backgroundColor = [UIColor clearColor]; //
//        self.cellRockImageView.backgroundColor = [UIColor clearColor];
//        
//    }
//    
//    
//}

@end
