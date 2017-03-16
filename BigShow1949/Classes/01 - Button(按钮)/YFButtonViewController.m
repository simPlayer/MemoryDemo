//
//  YFButtonViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/16.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFButtonViewController.h"

@interface YFButtonViewController ()

@end

@implementation YFButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titles = @[@"多次点击按钮",
                    @"微信注册按钮",
                    @"ape展开按钮",  // 猿题库动画
                    @"各种圆角按钮"];
    
    
    self.classNames = @[@"YFMultipleClicksViewController",
                        @"YFAnimationCircleButtonVC",
                        @"YFBubbleMenuButtonViewController",
                        @"YFAllRoundButtonVC_UIStoryboard"];

}


@end
