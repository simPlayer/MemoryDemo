//
//  YFWeChatViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFWeChatViewController.h"

@interface YFWeChatViewController ()

@end

@implementation YFWeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titles = @[@"摇一摇",
                    @"微信注册按钮"];
    
    self.classNames = @[@"YFWeChatShakeViewController",
                        @"YFAnimationCircleButtonVC"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
