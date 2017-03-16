//
//  YFNeteaseHomeViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFNeteaseHomeViewController.h"
#import "YFHomeLabelButton.h"
#import "YFHealineViewController.h"

@interface YFNeteaseHomeViewController () <UIScrollViewDelegate>

/** 存放标签 */
@property (nonatomic, strong) UIScrollView *labelsScrollView;
/** 存放具体的子控制器 */
@property (nonatomic, strong) UIScrollView *contentsScrollView;

@property (nonatomic, weak) YFHomeLabelButton *selectedButton;

@end

@implementation YFNeteaseHomeViewController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _labelsScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, YFScreen.width, 44)];
    _labelsScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_labelsScrollView];

    _contentsScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.labelsScrollView.frame), YFScreen.width, YFScreen.height - self.labelsScrollView.frame.size.height)];
    _contentsScrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_contentsScrollView];
    
    // 初始化子控制器
    [self setupChildVcs];
    
    // 初始化顶部标签
    [self setupLabels];
}

/**
 *  初始化顶部标签
 */
- (void)setupLabels
{
     // 不要刻意去调整scrollView的contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGFloat labelButtonW = 90;
    NSUInteger count = self.childViewControllers.count;
    for (NSUInteger i = 0; i < count; i++) {
        // 取出i位置对应的子控制器
        UIViewController *childVc = self.childViewControllers[i];
        
        // 添加标签
        YFHomeLabelButton *labelButton = [[YFHomeLabelButton alloc] init];
        
        labelButton.height = self.labelsScrollView.height;
        NSLog(@"height = %f", self.labelsScrollView.height);
        labelButton.width = labelButtonW;
        labelButton.y = 0;
        labelButton.x = i * labelButtonW;
        
        [labelButton setTitle:childVc.title forState:UIControlStateNormal];
        [labelButton addTarget:self action:@selector(labelClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.labelsScrollView addSubview:labelButton];
    }
    
    // 设置内容大小
    self.labelsScrollView.contentSize = CGSizeMake(count * labelButtonW, 0);
    self.contentsScrollView.contentSize = CGSizeMake(count * [UIScreen mainScreen].bounds.size.width, 0);
    
    // 设置输入法
    self.contentsScrollView.delegate = self;
}

/**
 *  初始化子控制器
 */
- (void)setupChildVcs
{
    YFHealineViewController *vc0 = [[YFHealineViewController alloc] init];
    vc0.title = @"头条";
    [self addChildViewController:vc0];
    
    YFHealineViewController *vc1 = [[YFHealineViewController alloc] init];
    vc1.title = @"政治";
    [self addChildViewController:vc1];
    
    YFHealineViewController *vc2 = [[YFHealineViewController alloc] init];
    vc2.title = @"经济";
    [self addChildViewController:vc2];
    
    YFHealineViewController *vc3 = [[YFHealineViewController alloc] init];
    vc3.title = @"体育";
    [self addChildViewController:vc3];
    
    YFHealineViewController *vc4 = [[YFHealineViewController alloc] init];
    vc4.title = @"国际";
    [self addChildViewController:vc4];
    
    YFHealineViewController *vc5 = [[YFHealineViewController alloc] init];
    vc5.title = @"哈哈";
    [self addChildViewController:vc5];
    
    YFHealineViewController *vc6 = [[YFHealineViewController alloc] init];
    vc6.title = @"呵呵";
    [self addChildViewController:vc6];
}

#pragma mark - 私有方法
/**
 *  监听按钮点击
 */
- (void)labelClick:(YFHomeLabelButton *)labelButton
{
    // 切换按钮状态
    self.selectedButton.selected = NO;
    labelButton.selected = YES;
    self.selectedButton = labelButton;
    
    // 切换子控制器
    NSUInteger index = [self.labelsScrollView.subviews indexOfObject:labelButton];
    [self switchChildVc:index];
}

/**
 *  切换子控制器
 *
 *  @param index 子控制器对应的索引
 */
- (void)switchChildVc:(NSUInteger)index
{
    // 添加index位置对应的控制器
    UIViewController *newChildVc = self.childViewControllers[index];
    if (newChildVc.view.superview == nil) {
        newChildVc.view.y = 0;
        newChildVc.view.width = self.contentsScrollView.width;
        newChildVc.view.height = self.contentsScrollView.height;
        newChildVc.view.x = index * newChildVc.view.width;
        [self.contentsScrollView addSubview:newChildVc.view];
    }
    
    // 滚动到index控制器对应的位置
    [self.contentsScrollView setContentOffset: CGPointMake(newChildVc.view.x, 0) animated:YES];
    
    // 让被点击的标签按钮显示在最中间
    CGFloat offsetX = self.selectedButton.centerX - self.labelsScrollView.width * 0.5;
    CGFloat maxOffsetX = self.labelsScrollView.contentSize.width - self.labelsScrollView.width;
    if (offsetX < 0) {
        offsetX = 0;
    } else if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.labelsScrollView setContentOffset:offset animated:YES];
}



#pragma mark - <UIScrollViewDelegate>
/**
 *  当scrollView减速完毕时调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.width;
    YFHomeLabelButton *labelButton = self.labelsScrollView.subviews[index];
    [self labelClick:labelButton];
}

/**
 *  当scrollView正在滚动时调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat value = scrollView.contentOffset.x / scrollView.width;
    NSUInteger oneIndex = (NSUInteger)value;
    NSUInteger twoIndex = oneIndex + 1;
    CGFloat twoPercent = value - oneIndex;
    CGFloat onePercent = 1 - twoPercent;
    
    YFHomeLabelButton *oneButton = self.labelsScrollView.subviews[oneIndex];
    [oneButton adjust:onePercent];
    
    if (twoIndex < self.labelsScrollView.subviews.count) {
        YFHomeLabelButton *twoButton = self.labelsScrollView.subviews[twoIndex];
        [twoButton adjust:twoPercent];
    }
}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    NSLog(@"scrollViewDidEndDragging");
//}


@end
