//
//  YFKnowledgeVC02.m
//  BigShow1949
//
//  Created by 杨帆 on 15-9-5.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import "YFKnowledgeVC02.h"

#import "SYHallViewController.h"
#import "SYArenaViewController.h"
#import "SYDiscoverViewController.h"
#import "SYHistoryViewController.h"
#import "SYMineViewController.h"

#import "SYTabBar.h"

@interface YFKnowledgeVC02 ()
@property (nonatomic, weak) SYTabBar *customTabBar;

@end

@implementation YFKnowledgeVC02

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"有bug";
    
    // 1.自定义tabBar
    [self setUpTabBar];
    
    // 2.为tabBar的每个Button添加控制器
    [self setUpAllChildViewController];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftClick)];

}

// 1.自定义tabBar
- (void)setUpTabBar {
    
    SYTabBar *myTabBar = [[SYTabBar alloc] init];
    
    //    myTabBar.delegate = self;
    myTabBar.tabBarBlock = ^(NSInteger selIndex){
        self.selectedIndex = selIndex;
    };
    
    self.customTabBar = myTabBar;
    myTabBar.frame = self.tabBar.frame;
    [self.view addSubview:myTabBar];
    
    [self.tabBar removeFromSuperview];
}

// 2.为tabBar的每个Button添加控制器
- (void)setUpAllChildViewController
{
    // 购彩大厅
    SYHallViewController *hall = [[SYHallViewController alloc] init];
    [self setUpOneChileViewController:hall imageName:@"TabBar_LotteryHall_new" selImageName:@"TabBar_LotteryHall_selected_new" title:@"购彩大厅"];
    
    // 竞技场
    SYArenaViewController *arena = [[SYArenaViewController alloc] init];
    [self setUpOneChileViewController:arena imageName:@"TabBar_Arena_new" selImageName:@"TabBar_Arena_selected_new" title:@"竞技场"];
    
    // 发现
    SYDiscoverViewController *dis = [[SYDiscoverViewController alloc] init];
    [self setUpOneChileViewController:dis imageName:@"TabBar_Discovery_new" selImageName:@"TabBar_Discovery_selected_new" title:@"发现"];
    
    // 中奖信息
    SYHistoryViewController *history = [[SYHistoryViewController alloc] init];
    [self setUpOneChileViewController:history imageName:@"TabBar_History_new" selImageName:@"TabBar_History_selected_new" title:@"中奖信息"];
    
    // 我的彩票
    SYMineViewController *mine = [[SYMineViewController alloc] init];
    [self setUpOneChileViewController:mine imageName:@"TabBar_MyLottery_new" selImageName:@"TabBar_MyLottery_selected_new" title:@"我的彩票"];
    
}

- (void)setUpOneChileViewController:(UIViewController *)vc imageName:(NSString *)imageName selImageName:(NSString *)selImageName title:(NSString *)title
{
    vc.navigationItem.title = title;// 有bug
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selImageName];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    // 添加按钮
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
    
}

- (void)tabBar:(SYTabBar *)tabBar didSelectIndex:(NSUInteger)selIndex
{
    self.selectedIndex = selIndex;
}

- (void)leftClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
