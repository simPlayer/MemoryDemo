//
//  YFLabelViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFLabelViewController.h"

@interface YFLabelViewController ()

@end

@implementation YFLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titles = @[@"自动布局标签",
                    @"球形滚动标签",
                    @"球形滚动标签2",
                    @"视觉效果标签云",
                    @"闪烁文字渐现",
                    @"闪烁文字渐现2",
                    @"快播动态标签",
                    @"跑马灯"];
    
    
    self.classNames = @[@"YFAutolayoutTagViewController_UIStoryboard",
                        @"YFSphereTagCloud",
                        @"YFSphereViewController",
                        @"YFTagsCloudViewController_UIStoryboard",
                        @"YFShineLabelViewController",
                        @"YFLazyInViewController_UIStoryboard",
                        @"YFDynamicLabelViewController",
                        @"YFMarqueeViewController"];

}




@end
