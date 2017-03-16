//
//  CoreAnimationViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/21.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "CoreAnimationViewController.h"

/*
 *  具体看文顶顶的博客:http://www.cnblogs.com/wendingding/p/3801157.html
 */

@interface CoreAnimationViewController ()

@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titles = @[@"基础动画",
                    @"关键帧动画",
                    @"转场动画",
                    @"组动画",
                    @"Transform"];
    
    self.classNames = @[@"CABasicAnimationViewController",
                        @"CAKeyframeAnimationViewController",
                        @"CATransitionViewController",
                        @"CAAnimationGroupViewController",
                        @"CATransformViewController_UIStoryboard"];

}



@end
