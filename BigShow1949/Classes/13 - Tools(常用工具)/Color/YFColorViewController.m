//
//  YFColorViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/31.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFColorViewController.h"
#import "UIColor+Extension.h"

@interface YFColorViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation YFColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap)];
    [self.view addGestureRecognizer:tap];
    
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, YFScreen.width, YFScreen.height)];
//    [];

//    // color2
//    UIColor *color1 = YFColor(223, 1, 144);
//    UIColor *color2 = [UIColor colorWithHexString:@"#DF0190" alpha:1];
//
//
//    NSString *str1 = [UIColor colorToHexStringWithColor:color1];
//    NSLog(@"str1 = %@", str1);
//    
//    NSString *str2 = [UIColor colorToRGBStringWithColor:color2];
//    
//    NSLog(@"str2 = %@", str2);
//    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    btn.backgroundColor = color1;
//    [self.view addSubview:btn];
//    
//    
//    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 220, 100, 100)];
//    btn2.backgroundColor = color2;
//    [self.view addSubview:btn2];
//    
//    
//    NSString *rgbStr = [UIColor colorToRGBStringWithHexString:@"#DF0190"];
//    NSLog(@"rgbStr = %@", rgbStr);
//    
//    NSString *hexStr = [UIColor colorToHexStringWithRGBRed:223 green:1 blue:144];
//    NSLog(@"hexStr = %@", hexStr);
}

- (void)backgroundTap {

    [self.view endEditing:YES];
}


- (IBAction)rgbToHexBtn:(id)sender {
    
    UIColor *color = [UIColor colorWithRGBRed:self.r.text.floatValue green:self.g.text.floatValue blue:self.b.text.floatValue];
    self.rgbToHexView.backgroundColor = color;

    // 转换
    self.rgbToHexLabel.text = [UIColor colorToHexStringWithColor:color];

}
- (IBAction)hexToRgbBtn:(id)sender {
    UIColor *color = [UIColor colorWithHexString:self.hexField.text];
    self.hexToRgbView.backgroundColor = color;
    
    // 转换
    //[UIColor colorToRGBStringWithColor:color];
    self.hexToRgbLabel.text = [UIColor colorToRGBStringWithHexString:self.hexField.text];
    
}
@end
