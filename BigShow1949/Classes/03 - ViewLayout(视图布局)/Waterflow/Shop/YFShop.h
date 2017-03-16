//
//  YFShop.h
//  BigShow1949
//
//  Created by 杨帆 on 15-9-2.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface YFShop : NSObject
/** 宽度 */
@property (nonatomic, assign) CGFloat w;
/** 高度 */
@property (nonatomic, assign) CGFloat h;
/** 价格 */
@property (nonatomic, copy) NSString *price;
/** 图片的url地址 */
@property (nonatomic, copy) NSString *img;
@end
