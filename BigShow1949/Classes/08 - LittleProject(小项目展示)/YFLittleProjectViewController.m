//
//  YFLittleProjectViewController.m
//  BigShow1949
//
//  Created by WangMengqi on 15/9/2.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import "YFLittleProjectViewController.h"

#import "YFRotateButtonViewController.h"
#import "YFLittleProjectVC02.h"
#import "YFLittleProjectVC03.h"


@implementation YFLittleProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"旋转动画",
                    @"表情键盘",
                    @"游戏2048",
                    @"拼图"];
    self.classNames = @[@"YFRotateButtonViewController",
                        @"YFLittleProjectVC02",
                        @"YFLittleProjectVC03",
                        @"YFJigsawViewController"];
    
}

@end
