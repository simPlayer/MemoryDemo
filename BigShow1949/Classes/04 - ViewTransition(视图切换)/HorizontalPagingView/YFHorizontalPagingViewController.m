//
//  YFHorizontalPagingViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/21.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFHorizontalPagingViewController.h"

#import "HHHorizontalPagingView.h"
#import "HHHeaderView.h"
#import "HHContentTableView.h"
#import "HHContentCollectionView.h"
#import "HHContentScrollView.h"

@interface YFHorizontalPagingViewController ()

@end

@implementation YFHorizontalPagingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    
    HHHeaderView *headerView                = [HHHeaderView headerView];
    HHContentTableView *tableView           = [HHContentTableView contentTableView];
    HHContentCollectionView *collectionView = [HHContentCollectionView contentCollectionView];
    HHContentScrollView *scrollView         = [HHContentScrollView contentScrollView];
    
    NSMutableArray *buttonArray = [NSMutableArray array];
    for(int i = 0; i < 3; i++) {
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [segmentButton setBackgroundImage:[UIImage imageNamed:@"button_normal_YFHorizontalPagingViewController"] forState:UIControlStateNormal];
        [segmentButton setBackgroundImage:[UIImage imageNamed:@"button_selected_YFHorizontalPagingViewController"] forState:UIControlStateSelected];
        [segmentButton setTitle:[NSString stringWithFormat:@"view%@",@(i)] forState:UIControlStateNormal];
        [segmentButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [buttonArray addObject:segmentButton];
    }
    HHHorizontalPagingView *pagingView = [HHHorizontalPagingView pagingViewWithHeaderView:headerView headerHeight:300.f segmentButtons:buttonArray segmentHeight:60 contentViews:@[tableView, collectionView, scrollView]];
    //    pagingView.segmentButtonSize = CGSizeMake(60., 30.);              //自定义segmentButton的大小
    //    pagingView.segmentView.backgroundColor = [UIColor grayColor];     //设置segmentView的背景色
    
    //设置需放大头图的top约束
    /*
     pagingView.magnifyTopConstraint = headerView.headerTopConstraint;
     [headerView.headerImageView setImage:[UIImage imageNamed:@"headerImage"]];
     [headerView.headerImageView setContentMode:UIViewContentModeScaleAspectFill];
     */
    
    [self.view addSubview:pagingView];
    
}



@end
