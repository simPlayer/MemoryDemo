//
//  YFResponderChainViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/4/13.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFResponderChainViewController.h"

#import "UIViewA.h"
#import "UIViewB.h"

@interface YFResponderChainViewController ()

@end

@implementation YFResponderChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    /*
     层级:
     viewA
         buttonA
         viewB
             buttonB
     */
    /*
     
     问题:
       1)ButtonA和ButtonB都能响应消息
       2）ViewA也能收到ViewB所收到的touches消息
       3）不让ViewB（ButtonB）收到消息
     */
    
    // viewA
    UIViewA *viewA = [[UIViewA alloc] initWithFrame:CGRectMake(0, 64, 320, 400)];
    viewA.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:viewA];
    
    // buttonA
    UIButton *buttonA = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    viewA.buttonA = buttonA;
    buttonA.backgroundColor = [UIColor redColor];
    [buttonA addTarget:self action:@selector(buttonAClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewA addSubview:buttonA];
    
    // viewB
    UIViewB *viewB = [[UIViewB alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    viewB.backgroundColor = [UIColor greenColor];
    viewB.alpha = 0.4;  // 绿 + 红 透明度, buttonA的颜色会变
    [viewA addSubview:viewB];

    // buttonB
    UIButton *buttonB = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    buttonB.backgroundColor = [UIColor blueColor];
    [buttonB addTarget:self action:@selector(buttonBClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewB addSubview:buttonB];
    
}

- (void)buttonAClick:(UIButton *)button {
    
    NSLog(@"点击了buttonA----");
}


- (void)buttonBClick:(UIButton *)button {
    
    NSLog(@"点击了buttonB----");
}



@end
