//
//  YFToolsViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/31.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFToolsViewController.h"

@interface YFToolsViewController ()

@end

@implementation YFToolsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"颜色转换",
                    @"图片",
                    @"无数据界面提示"];
    
    self.classNames = @[@"YFColorViewController_UIStoryboard",
                        @"YFImageCategoryViewController",
                        @"YFEmptyDataSetViewController_UIStoryboard"];

}



@end
