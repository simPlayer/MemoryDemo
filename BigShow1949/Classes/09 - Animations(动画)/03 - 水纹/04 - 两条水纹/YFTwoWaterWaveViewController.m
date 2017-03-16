//
//  YFTwoWaterWaveViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/21.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFTwoWaterWaveViewController.h"
#import "LXHTwoWaterWaveView.h"

@interface YFTwoWaterWaveViewController ()

@end

@implementation YFTwoWaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    LXHTwoWaterWaveView *waterView = [[LXHTwoWaterWaveView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:waterView];
}



@end
