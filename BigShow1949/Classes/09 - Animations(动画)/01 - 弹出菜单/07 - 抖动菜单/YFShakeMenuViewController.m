//
//  YFShakeMenuViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/21.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFShakeMenuViewController.h"
#import "XRPopMenuView.h"


@interface YFShakeMenuViewController ()

@end

@implementation YFShakeMenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self configButton];
}


- (void)configButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(.0f, .0f, 80.0f, 40.0f)];
    [button setTitle:@"点击弹出" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.center = self.view.center;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(id)sender
{
    [self showPopMenu];
}

- (void)showPopMenu
{
    XRPopMenuView *menuView = [[XRPopMenuView alloc] init];
    [menuView addMenuItemWithTitle:@"创建标签" andIcon:[UIImage imageNamed:@"editButton"] andSelectedBlock:^{
        NSLog(@"创建标签 selected");
    }];
    [menuView addMenuItemWithTitle:@"添加标签" andIcon:[UIImage imageNamed:@"markButton"] andSelectedBlock:^{
        NSLog(@"添加标签 selected");
    }];
    [menuView addMenuItemWithTitle:@"创建标签" andIcon:[UIImage imageNamed:@"editButton"] andSelectedBlock:^{
        NSLog(@"创建标签 selected");
    }];
    [menuView addMenuItemWithTitle:@"添加标签" andIcon:[UIImage imageNamed:@"markButton"] andSelectedBlock:^{
        NSLog(@"添加标签 selected");
    }];
    [menuView addMenuItemWithTitle:@"创建标签" andIcon:[UIImage imageNamed:@"editButton"] andSelectedBlock:^{
        NSLog(@"创建标签 selected");
    }];
    [menuView addMenuItemWithTitle:@"添加标签" andIcon:[UIImage imageNamed:@"markButton"] andSelectedBlock:^{
        NSLog(@"添加标签 selected");
    }];
    
    [menuView show];
}


@end
