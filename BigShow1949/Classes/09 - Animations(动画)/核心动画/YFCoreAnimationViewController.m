//
//  YFCoreAnimationViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFCoreAnimationViewController.h"

@interface YFCoreAnimationViewController ()

@end

@implementation YFCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titles = @[@"核心动画基础篇",
                    @"3D翻转push跳转",
                    @"登陆转场动画"];
    
    self.classNames = @[@"CoreAnimationViewController",
                        @"YFPushTransitionViewController",
                        @"YFLoginTransitionViewController"];
}



@end
