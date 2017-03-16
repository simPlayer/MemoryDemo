//
//  YFRipple2ViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/20.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFRipple2ViewController.h"
#import "BMWaveButton.h"

@interface YFRipple2ViewController ()
@property (strong, nonatomic) BMWaveButton *bcnBase;

@end

@implementation YFRipple2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    //初始化
    _bcnBase = [[BMWaveButton alloc] initWithType:BMWaveButtonDefault Image:@"YFRipple2ViewController.jpg"];
    [_bcnBase StartWave];
    [self.view addSubview:_bcnBase];
}


@end
