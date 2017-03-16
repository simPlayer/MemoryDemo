//
//  YFRatingBarViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/24.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFRatingBarViewController.h"
#import "YFRatingBar.h"
@interface YFRatingBarViewController ()

@property (nonatomic, strong) YFRatingBar *bar;

@end

@implementation YFRatingBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    YFRatingBar *bar = [[YFRatingBar alloc] initWithFrame:CGRectMake(50, 50, 260, 35)];  // 5
    self.bar = bar;
    bar.viewColor = [UIColor lightGrayColor];
    bar.starSelectNumber = 4;
    bar.miniSelectNumber = 3;
    [self.view addSubview:bar];
    
    bar.center = self.view.center;
    
    // test
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

}


- (void)btnClick:(UIButton *)btn {

    NSLog(@"starTotalNumber = %zd, starSelectNumber = %zd, bar.scale = %zd", self.bar.starTotalNumber, self.bar.starSelectNumber, self.bar.scale);

}



@end
