//
//  YFLoginTransitionViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFLoginTransitionViewController.h"
#import "YFLoginSecondViewController.h"

#import "HyTransitions.h"
#import "HyLoglnButton.h"

@interface YFLoginTransitionViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UISwitch *Switch;

@end

@implementation YFLoginTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // imageView
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, YFScreen.width, YFScreen.height)];
    imgView.image = [UIImage imageNamed:@"Login"];
    [self.view addSubview:imgView];
    
    // Switch
    CGFloat switchW = 60;
    CGFloat switchH = 40;
    CGFloat padding = 10;
    UISwitch *Switch = [[UISwitch alloc] initWithFrame:CGRectMake(YFScreen.width - switchW - padding, YFScreen.height - switchH - padding, switchW, switchH)];
    [self.view addSubview:Switch];
    self.Switch = Switch;
    
    // button
    [self createPresentControllerButton];
}

-(void)createPresentControllerButton{
    
    HyLoglnButton *log = [[HyLoglnButton alloc] initWithFrame:CGRectMake(20, CGRectGetHeight(self.view.bounds) - (40 + 80), [UIScreen mainScreen].bounds.size.width - 40, 40)];
    [log setBackgroundColor:[UIColor colorWithRed:1 green:0.f/255.0f blue:128.0f/255.0f alpha:1]];
    [self.view addSubview:log];
    [log setTitle:@"登录" forState:UIControlStateNormal];
    [log addTarget:self action:@selector(PresentViewController:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)PresentViewController:(HyLoglnButton *)button{
    
    typeof(self) __weak weak = self;
    //模拟网络访问
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weak LoginButton:button];
    });
}

-(void)LoginButton:(HyLoglnButton *)button
{
    typeof(self) __weak weak = self;
    if (_Switch.on) {
        //网络正常 或者是密码账号正确跳转动画
        [button ExitAnimationCompletion:^{
            if (weak.Switch.on) {
                [weak didPresentControllerButtonTouch];
            }
        }];
    }else{
        //网络错误 或者是密码不正确还原动画
        [button ErrorRevertAnimationCompletion:^{
            if (weak.Switch.on) {
                [weak didPresentControllerButtonTouch];
            }
        }];
    }
}

- (void)didPresentControllerButtonTouch
{
    
    UIViewController *controller = [YFLoginSecondViewController new];
    
    controller.transitioningDelegate = self;
    
    UINavigationController *nai = [[UINavigationController alloc] initWithRootViewController:controller];
    nai.transitioningDelegate = self;
    
    [self presentViewController:nai animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    
    return [[HyTransitions alloc]initWithTransitionDuration:0.4f StartingAlpha:0.5f isBOOL:true];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [[HyTransitions alloc]initWithTransitionDuration:0.4f StartingAlpha:0.8f isBOOL:false];
}


@end
