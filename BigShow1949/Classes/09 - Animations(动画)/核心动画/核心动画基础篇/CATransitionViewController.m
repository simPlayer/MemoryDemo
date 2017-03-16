//
//  CATransitionViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()
@property(nonatomic,assign) int index;
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation CATransitionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    imgView.center = CGPointMake(YFScreen.width / 2, YFScreen.width / 2 + 100);
    imgView.image = [UIImage imageNamed:@"Transition0.jpg"];
    self.imgView = imgView;
    [self.view addSubview:imgView];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(imgView.frame) + 50, 100, 50)];
    [nextBtn setTitle:@"下一个" forState:UIControlStateNormal];
    nextBtn.backgroundColor = [UIColor lightGrayColor];
    [nextBtn addTarget:self action:@selector(text) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    
//    self.index=1;
    
}

- (void)text {
    
    self.index++;
    if (self.index>3) {
        self.index=0;
    }
    self.imgView.image=[UIImage imageNamed: [NSString stringWithFormat:@"Transition%d.jpg",self.index]];

    //1.创建核心动画
    CATransition *ca=[CATransition animation];

    //1.1告诉要执行什么动画
    //1.2设置过度效果
    ca.type=@"cube";
    //1.3设置动画的过度方向（向右）
    ca.subtype=kCATransitionFromRight;
    //1.4设置动画的时间
    ca.duration=2.0;
    //1.5设置动画的起点
    ca.startProgress=0.5;
    //1.6设置动画的终点
    //    ca.endProgress=0.5;

    //2.添加动画
    [self.imgView.layer addAnimation:ca forKey:nil];

}

//- (IBAction)preOnClick:(UIButton *)sender {
//    self.index--;
//    if (self.index<1) {
//        self.index=7;
//    }
//    self.iconView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.jpg",self.index]];
//    
//    //创建核心动画
//    CATransition *ca=[CATransition animation];
//    //告诉要执行什么动画
//    //设置过度效果
//    ca.type=@"cube";
//    //设置动画的过度方向（向左）
//    ca.subtype=kCATransitionFromLeft;
//    //设置动画的时间
//    ca.duration=2.0;
//    //添加动画
//    [self.iconView.layer addAnimation:ca forKey:nil];
//}
//
////下一张
//- (IBAction)nextOnClick:(UIButton *)sender {
//    self.index++;
//    if (self.index>7) {
//        self.index=1;
//    }
//    self.iconView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.jpg",self.index]];
//    
//    //1.创建核心动画
//    CATransition *ca=[CATransition animation];
//    
//    //1.1告诉要执行什么动画
//    //1.2设置过度效果
//    ca.type=@"cube";
//    //1.3设置动画的过度方向（向右）
//    ca.subtype=kCATransitionFromRight;
//    //1.4设置动画的时间
//    ca.duration=2.0;
//    //1.5设置动画的起点
//    ca.startProgress=0.5;
//    //1.6设置动画的终点
//    //    ca.endProgress=0.5;
//    
//    //2.添加动画
//    [self.iconView.layer addAnimation:ca forKey:nil];
//}
@end
