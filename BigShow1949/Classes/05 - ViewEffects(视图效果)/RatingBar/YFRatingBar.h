//
//  YFRatingBar.h
//  BigShow1949
//
//  Created by zhht01 on 16/3/24.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFRatingBar : UIView


@property (nonatomic,assign) NSInteger starTotalNumber;   // 默认: 5

@property (nonatomic,assign) NSInteger starSelectNumber;  // 默认: 星星总数

@property (nonatomic,assign) NSInteger miniSelectNumber;  // 最小选择星星数 默认: 1

@property (nonatomic,assign,readonly) NSInteger scale;    // 获得的分数
/**
 *  调整底部视图的颜色 (默认:白色)
 */
@property (nonatomic,strong) UIColor *viewColor;

/**
 *  是否允许可触摸 (默认:允许)
 */
@property (nonatomic,assign) BOOL enable;

/**
 *  是否允许滑动选择 (默认:允许) (在enable = YES的前提下才有意义)
 */
@property (nonatomic,assign) BOOL scrollSelectEnable;






@end
