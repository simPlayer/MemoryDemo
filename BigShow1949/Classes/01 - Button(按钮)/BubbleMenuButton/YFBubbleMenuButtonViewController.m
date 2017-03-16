//
//  YFBubbleMenuButtonViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/30.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFBubbleMenuButtonViewController.h"
#import "DWBubbleMenuButton.h"

@interface YFBubbleMenuButtonViewController ()

@end

@implementation YFBubbleMenuButtonViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Create down menu button
    UILabel *homeLabel = [self createHomeButtonView];
    
    DWBubbleMenuButton *downMenuButton = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(100.f,
                                                                                              100.f,
                                                                                              homeLabel.frame.size.width,
                                                                                              homeLabel.frame.size.height)
                                                                expansionDirection:DirectionDown];
    downMenuButton.homeButtonView = homeLabel;
//    downMenuButton.backgroundColor = [UIColor blueColor];
    [downMenuButton addButtons:[self createDemoButtonArray]];
    
    [self.view addSubview:downMenuButton];
}

- (void)viewDidAppear:(BOOL)animated {

    
//    // Create up menu button
//    homeLabel = [self createHomeButtonView];
//    
//    DWBubbleMenuButton *upMenuView = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - homeLabel.frame.size.width - 20.f,
//                                                                                          self.view.frame.size.height - homeLabel.frame.size.height - 20.f,
//                                                                                          homeLabel.frame.size.width,
//                                                                                          homeLabel.frame.size.height)
//                                                            expansionDirection:DirectionUp];
//    upMenuView.homeButtonView = homeLabel;
//    
//    [upMenuView addButtons:[self createDemoButtonArray]];
//    
//    [self.view addSubview:upMenuView];
}

- (UILabel *)createHomeButtonView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    
    label.text = @"Tap";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = label.frame.size.height / 2.f;
    label.backgroundColor =[UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
    label.clipsToBounds = YES;
    
    return label;
}

- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (NSString *title in @[@"A", @"B", @"C", @"D", @"E", @"F"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0.f, 0.f, 30.f, 30.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        
        [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonsMutable addObject:button];
    }
    
    return [buttonsMutable copy];
}

- (void)test:(UIButton *)sender {
    NSLog(@"Button tapped, tag: %ld", (long)sender.tag);
}

- (UIButton *)createButtonWithName:(NSString *)imageName {
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button sizeToFit];
    
    [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}



@end

