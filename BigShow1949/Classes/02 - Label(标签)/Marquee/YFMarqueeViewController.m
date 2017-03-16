//
//  YFMarqueeViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFMarqueeViewController.h"
#import "GZView.h"

#import "YFCycleView.h"
@interface YFMarqueeViewController ()

@property(nonatomic,strong) NSTimer* timer;// 定义定时器
@property(nonatomic,weak) UILabel *customLab;

@property(nonatomic,strong) UIView *viewAnima; //装 滚动视图的容器
@end

@implementation YFMarqueeViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    //设置导航的透明度
    //    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    
    //*******添加中间标题
//    [self addMiddleTitleView];
    
    
//    // 启动NSTimer定时器来改变UIImageView的位置
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
//                                                  target:self selector:@selector(changePos)
//                                                userInfo:nil repeats:YES];
    
    YFCycleView *cycleView = [[YFCycleView alloc] initWithFrame:CGRectMake(0, 64, YFScreen.width, 40)];
    cycleView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:cycleView];
    
    
    
    //***********实现钱包视图******************
    //    GZView *viewAnim = [[GZView alloc] init];
    //    viewAnim.frame = CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    //    [view addSubview:viewAnim];
    
}


//添加中间视图
-(void) addMiddleTitleView
{
    //定义视图大小
    CGFloat viewX = (self.view.frame.size.width-200)/2;
    UIView *viewAnima = [[UIView alloc] initWithFrame:CGRectMake(viewX, 100, 200, 40)];
    viewAnima.backgroundColor = [UIColor  whiteColor];
    self.viewAnima = viewAnima;
    //定义视图容器
    //     [self.view addSubview:viewAnima];
    self.navigationItem.titleView = self.viewAnima;
    
    
    CGFloat customLabY = (self.viewAnima.frame.size.height - 30)/2;
    UILabel *customLab = [[UILabel alloc] init];
    customLab.frame = CGRectMake(self.viewAnima.frame.size.width, customLabY, 250, 30);
    [customLab setTextColor:[UIColor redColor]];
    [customLab setText:@"过年啦！触碰屏幕，有惊奇哦！"];
    customLab.font = [UIFont boldSystemFontOfSize:17];
    self.customLab = customLab;
    
    
    
    //添加视图
    [self.viewAnima addSubview:customLab];
}

//其实蝴蝶的整个移动都是————靠iv.center来去设置的
- (void) changePos
{
    CGPoint curPos = self.customLab.center;
    
    // 当curPos的x坐标已经超过了屏幕的宽度
    if(curPos.x < -100)
    {
        CGFloat jianJu = self.customLab.frame.size.width/2;
        // 控制蝴蝶再次从屏幕左侧开始移动
        self.customLab.center = CGPointMake(self.viewAnima.frame.size.width + jianJu, 20);
    }
    else
    {
        // 通过修改iv的center属性来改变iv控件的位置
        self.customLab.center = CGPointMake(curPos.x - 4, 20);
    }
    //其实蝴蝶的整个移动都是————靠iv.center来去设置的
}



@end


