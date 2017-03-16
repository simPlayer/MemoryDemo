//
//  YFWaterRippleViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/21.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFWaterRippleViewController.h"
#import "RippleModel.h"
#import "RippleView.h"


@interface YFWaterRippleViewController (){
    RippleView  *rippleView;
}

@end

@implementation YFWaterRippleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage imageNamed:@"home_top_bg"];
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    rippleView = [[RippleView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)
                                           context:context];
    [self.view addSubview:rippleView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [rippleView addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [rippleView addGestureRecognizer:tap];
}

- (void)handleGesture:(UITapGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:rippleView];
    [rippleView.ripple initiateRippleAtLocation:location];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
