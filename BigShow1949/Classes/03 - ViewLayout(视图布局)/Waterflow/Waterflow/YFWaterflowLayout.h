//
//  YFWaterflowLayout.h
//  BigShow1949
//
//  Created by 杨帆 on 15-9-2.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFWaterflowLayout;

@protocol YFWaterflowLayoutDelegate <NSObject>
- (CGFloat)waterflowLayout:(YFWaterflowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth;

@optional
/**
 *  返回四边的间距, 默认是UIEdgeInsetsMake(10, 10, 10, 10)
 */
- (UIEdgeInsets)insetsInWaterflowLayout:(YFWaterflowLayout *)waterflowLayout;
/**
 *  返回最大的列数, 默认是3
 */
- (int)maxColumnsInWaterflowLayout:(YFWaterflowLayout *)waterflowLayout;
/**
 *  返回每行的间距, 默认是10
 */
- (CGFloat)rowMarginInWaterflowLayout:(YFWaterflowLayout *)waterflowLayout;
/**
 *  返回每列的间距, 默认是10
 */
- (CGFloat)columnMarginInWaterflowLayout:(YFWaterflowLayout *)waterflowLayout;
@end



@interface YFWaterflowLayout : UICollectionViewLayout
@property (nonatomic, weak) id<YFWaterflowLayoutDelegate> delegate;
@end
