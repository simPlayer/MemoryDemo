//
//  YFWaterWaveViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/20.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFWaterWaveViewController.h"

@interface YFWaterWaveViewController ()

@end

@implementation YFWaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titles = @[@"放大水波纹",
                    @"放大水波纹2",
                    @"一条水纹",
                    @"两条水纹",
                    @"水波浪"];
    
    self.classNames = @[@"YFRippleViewController",
                        @"YFRipple2ViewController",
                        @"YFOneWaterWaveViewController",
                        @"YFTwoWaterWaveViewController",
                        @"YFWaterRippleViewController"];

}


@end
