//
//  YFPopMenuViewController.m
//  BigShow1949
//
//  Created by 杨帆 on 15-9-4.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import "YFPopMenuViewController.h"

@implementation YFPopMenuViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.titles = @[@"下拉渐变选框",
                    @"5个旋转菜单",
                    @"动态弹出框",
                    @"放射性菜单",
                    @"自定义弹出框类型",
                    @"可以拖拽的菜单",
                    @"抖动菜单",];
    
    self.classNames = @[@"YFContextMenuViewController",
                        @"YFAnimationVC02",
                        @"YFAnimationVC03",
                        @"YFAnimationVC04",
                        @"YFAnimationVC05",
                        @"YFAnimationVC06",
                        @"YFShakeMenuViewController",];
}

@end
