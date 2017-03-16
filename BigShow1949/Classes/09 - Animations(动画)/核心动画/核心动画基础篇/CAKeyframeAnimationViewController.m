//
//  CAKeyframeAnimationViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"
#define angle2Radian(angle)  ((angle)/180.0*M_PI)

@interface CAKeyframeAnimationViewController ()
@property (nonatomic, strong) UILabel *customView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;


@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    // label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    label.text = @"动画块";
    label.backgroundColor = [UIColor blueColor];
    self.customView = label;
    [self.view addSubview:label];
    
    // rightBarButtonItem
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"结束动画" style:UIBarButtonItemStylePlain target:self action:@selector(stop)];
    
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"one", @"two", @"three"]];
    segmentedControl.frame = CGRectMake(0, 0, 150, 44);
    segmentedControl.center = CGPointMake(YFScreen.width / 2, 100);
    [segmentedControl addTarget:self action:@selector(test:) forControlEvents:UIControlEventValueChanged];
//    self.segmentedControl = segmentedControl;
    [self.view addSubview:segmentedControl];
    
}
- (void)test:(UISegmentedControl *)segmentedControl {

    if (segmentedControl.selectedSegmentIndex == 0) {
        [self test1];
    }else if (segmentedControl.selectedSegmentIndex == 1) {
        [self test2];
    }else if (segmentedControl.selectedSegmentIndex == 2) {
        [self test3];
    }
}


- (void)test1 {

    //1.创建核心动画
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //平移
    keyAnima.keyPath=@"position";
    //1.1告诉系统要执行什么动画
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    keyAnima.values=@[value1,value2,value3,value4,value5];
    //1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    keyAnima.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima.duration=4.0;
    //1.5设置动画的节奏
    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //设置代理，开始—结束
    keyAnima.delegate=self;
    //2.添加核心动画
    [self.customView.layer addAnimation:keyAnima forKey:@"test"];

}

- (void)test2 {
    
    //1.创建核心动画
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //平移
    keyAnima.keyPath=@"position";
    //1.1告诉系统要执行什么动画
    //创建一条路径
    CGMutablePathRef path=CGPathCreateMutable();
    //设置一个圆的路径
    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
    keyAnima.path=path;
    
    //有create就一定要有release
    CGPathRelease(path);
    //1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    keyAnima.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima.duration=5.0;
    //1.5设置动画的节奏
    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //设置代理，开始—结束
    keyAnima.delegate=self;
    //2.添加核心动画
    [self.customView.layer addAnimation:keyAnima forKey:@"test"];

}

- (void)test3 {

    //1.创建核心动画
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    keyAnima.keyPath=@"transform.rotation";
    //设置动画时间
    keyAnima.duration=0.1;
    //设置图标抖动弧度
    //把度数转换为弧度  度数/180*M_PI
    keyAnima.values=@[@(-angle2Radian(4)),@(angle2Radian(4)),@(-angle2Radian(4))];
    //设置动画的重复次数(设置为最大值)
    keyAnima.repeatCount=  29;  //MAXFLOAT;
    
    keyAnima.fillMode=kCAFillModeForwards;
    keyAnima.removedOnCompletion=NO;
    //2.添加动画
    [self.customView.layer addAnimation:keyAnima forKey:@"test"];
}

- (void)stop {

    //停止self.customView.layer上名称标示为 test 的动画
    [self.customView.layer removeAnimationForKey:@"test"];
}

-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"开始动画");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"结束动画");
}

@end
