//
//  YFAnimationVC06.m
//  BigShow1949
//
//  Created by WangMengqi on 15/9/2.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import "YFAnimationVC06.h"
#import "YFDragRadialMenu.h"

@interface YFAnimationVC06 ()

@end

@implementation YFAnimationVC06

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 140, 21)];
    tipLabel.text = @"长按屏幕任何位置";
    tipLabel.textColor = [UIColor grayColor];
    tipLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:tipLabel];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(presentMenu:)];
    longPressRecognizer.minimumPressDuration = 1;
    
    [self.view addGestureRecognizer:longPressRecognizer];
}

-(void) presentMenu:(UILongPressGestureRecognizer *)gestureRecognizer{
    CGPoint location = [gestureRecognizer locationInView:self.view];
    if(gestureRecognizer.state == UIGestureRecognizerStateBegan){
        YFDragRadialMenu *thisMenu = [[YFDragRadialMenu alloc] initFromPoint:location withDataSource:self andDelegate:self];
        
        [thisMenu showMenu];
    }
}

#pragma mark - YFDragRadialMenuDelegate & YFDragRadialMenuDataSource
-(NSInteger) numberOfButtonsForRadialMenu:(YFDragRadialMenu *)radialMenu{
    return 6;
}

-(CGFloat) radiusLenghtForRadialMenu:(YFDragRadialMenu *)radialMenu{
    return 100;
}

-(UIButton *)radialMenu:(YFDragRadialMenu *)radialMenu elementAtIndex:(NSInteger)index{
    UIButton *element = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    element.backgroundColor = [UIColor whiteColor];
    element.layer.cornerRadius = element.bounds.size.height/2.0;
    element.layer.borderColor = [UIColor blackColor].CGColor;
    element.layer.borderWidth = 1;
    element.tag = index;
    
    return element;
}

-(void)radialMenu:(YFDragRadialMenu *)radialMenu didSelectButton:(UIButton *)button{
    NSLog(@"button(element) index:%ld",(long)button.tag);
    [radialMenu closeMenu];
}

-(UIView *)viewForCenterOfRadialMenu:(YFDragRadialMenu *)radialMenu{
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    
    centerView.backgroundColor = [UIColor blackColor];
    
    return centerView;
}

-(void)radialMenu:(YFDragRadialMenu *)radialMenu customizationForRadialMenuView:(UIView *)radialMenuView{
    CALayer *bgLayer = [CALayer layer];
    bgLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    bgLayer.borderColor = [UIColor colorWithWhite:200.0/255.0 alpha:1].CGColor;
    bgLayer.borderWidth = 1;
    bgLayer.cornerRadius = radialMenu.menuRadius;  
    bgLayer.frame = CGRectMake(radialMenuView.frame.size.width/2.0-radialMenu.menuRadius, radialMenuView.frame.size.height/2.0-radialMenu.menuRadius, radialMenu.menuRadius*2, radialMenu.menuRadius*2);
    [radialMenuView.layer insertSublayer:bgLayer atIndex:0];
}

-(BOOL)canDragRadialMenu:(YFDragRadialMenu *)radialMenu{
    return YES;
}



@end
