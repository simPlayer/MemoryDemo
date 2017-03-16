//
//  YFOneWaterWaveViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/21.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFOneWaterWaveViewController.h"

#define ScreenRect [[UIScreen mainScreen] bounds]

@interface YFOneWaterWaveViewController ()

/**
 *  绘制层
 */
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

/**
 *  重绘定时器
 */
@property (nonatomic, strong) CADisplayLink *displayLink;

/**
 *  水波的高度
 */
@property (nonatomic, assign) CGFloat waterWaveHeight;

/**
 *  Y 轴方向的缩放
 */
@property (nonatomic, assign) CGFloat zoomY;

/**
 *  X 轴方向的平移
 */
@property (nonatomic, assign) CGFloat translateX;


@property (nonatomic, assign) BOOL flag;
@end

@implementation YFOneWaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self commitInit];
    
    [self addShapeLayer];
    
    [self startDisplayLink];
}

// 初始化数据
- (void)commitInit
{
    // 水波高度
    self.waterWaveHeight = ScreenRect.size.height / 2;
    
    self.zoomY = 1.0f;
    self.translateX = 0.0f;
    self.flag = NO;
}

- (void)addShapeLayer
{
    self.shapeLayer = [CAShapeLayer layer];
    
    // 绘制的路径
    self.shapeLayer.path = [self waterWavePath];
    // 填充的颜色
    self.shapeLayer.fillColor = [[UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1] CGColor];
    // 路径线条的颜色
    self.shapeLayer.lineWidth = 0.1;
    // 路径线条的颜色
    self.shapeLayer.strokeColor = [[UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1] CGColor];
    
    [self.view.layer addSublayer:self.shapeLayer];
}

- (CGPathRef)waterWavePath
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, nil, 0, self.waterWaveHeight);
    
    CGFloat y = 0.0f;
    for (float x = 0; x <= ScreenRect.size.width; x ++)
    {
        y= self.zoomY * sin( x / 180 * M_PI - 4 * self.translateX / M_PI ) * 5 + self.waterWaveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, ScreenRect.size.width, ScreenRect.size.height);
    CGPathAddLineToPoint(path, nil, 0, ScreenRect.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.waterWaveHeight);
    
    return (CGPathRef)path;
}


- (void)startDisplayLink
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)stopDisplayLink
{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink
{
    
    self.translateX += 0.1;// 平移
    if (!self.flag)
    {
        self.zoomY += 0.02;
        if (self.zoomY >= 1.5)
        {
            self.flag = YES;
        }
    }
    else
    {
        self.zoomY -= 0.02;
        if (self.zoomY <= 1.0)
        {
            self.flag = NO;
        }
    }
    
    // 内存释放问题 -- 重要
    CGPathRelease(self.shapeLayer.path);
    self.shapeLayer.path = [self waterWavePath];
}



@end
