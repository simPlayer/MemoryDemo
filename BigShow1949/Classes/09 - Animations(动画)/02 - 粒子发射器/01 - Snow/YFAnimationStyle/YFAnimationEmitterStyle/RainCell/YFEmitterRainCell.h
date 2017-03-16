//
//  YFRainCell.h
//  BigShow1949
//
//  Created by 杨帆 on 15-9-4.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#import "YFPublicParticleCell.h"
#import "UIImage+Extension.h"

@interface YFEmitterRainCell : YFPublicParticleCell


/**
 *  传入粒子图片样式名称,粒子半径,粒子移动速度,生成粒子
 *
 *  @param cellImg  粒子图片样式名称
 *  @param radious  粒子半径
 *  @param velocity 粒子移动速度
 *
 *  @return 粒子
 */
+ (instancetype)rainCellWithCellImg:(NSString *)cellImg andRadious:(CGFloat)radious andVelocity:(CGFloat)velocity andDirection:(YFEmitterParticleCellDirection)direction;
@end

