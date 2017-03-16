//
//  YFCircleViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/21.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFCircleViewController.h"

@interface YFCircleViewController (){
    double add;
}
//创建全局属性的ShapeLayer
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation YFCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initCircle];
    
    [self startAnimation];

}

- (void)startAnimation {
    
    add = 0.1;//每次递增0.1
    //用定时器模拟数值输入的情况
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                              target:self
                                            selector:@selector(circleAnimationTypeOne)
                                            userInfo:nil
                                             repeats:YES];
    

}

- (void)circleAnimationTypeOne
{
    if (self.shapeLayer.strokeEnd > 1 && self.shapeLayer.strokeStart < 1) {
        self.shapeLayer.strokeStart += add;
    }else if(self.shapeLayer.strokeStart == 0){
        self.shapeLayer.strokeEnd += add;
    }
    
    if (self.shapeLayer.strokeStart == 1) {
        self.shapeLayer.strokeStart = 0;
        self.shapeLayer.strokeEnd = 1;
    }
    
//    if (self.shapeLayer.strokeEnd == 0) {
//        self.shapeLayer.strokeStart = 0;
//    }
//    
//    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
//        self.shapeLayer.strokeEnd = 0;
//    }
}

- (void)initCircle {

    //创建出CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 200, 200);//设置shapeLayer的尺寸和位置
    self.shapeLayer.position = self.view.center;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
    
    //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 1.0f;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    //创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    //让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    
    //添加并显示
    [self.view.layer addSublayer:self.shapeLayer];
    
//    //设置stroke起始点
//    self.shapeLayer.strokeStart = 0.25;  // 默认为0
//    self.shapeLayer.strokeEnd = 0.75;  // 默认为1
    
    // 在这里就是起始笔和结束笔的位置
    // Stroke为1的话就是一整圈，0.5就是半圈，0.25就是1/4圈
}



@end
