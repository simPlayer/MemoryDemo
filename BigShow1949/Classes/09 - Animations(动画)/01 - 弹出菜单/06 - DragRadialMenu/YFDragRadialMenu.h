//
//  YFDragRadialMenu.h
//  BigShow1949
//
//  Created by WangMengqi on 15/9/2.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YFDragRadialMenuDelegate;
@protocol YFDragRadialMenuDataSource;

@interface YFDragRadialMenu : UIView<UIGestureRecognizerDelegate>

// readonly
@property (nonatomic, readonly) CGPoint centerPoint;
@property (nonatomic, assign) CGFloat menuRadius;  // 灰色view的半径
@property (nonatomic, assign) NSInteger numberOfButtons;
@property (nonatomic, strong) UIView *radialMenuView; // 深灰色的view(外面的大圆)

@property (nonatomic, copy) UIColor *dimBackgroundColor; // YFDragRadialMenu的背景色, 默认黑色, 透明度0.3

@property (nonatomic, weak) id<YFDragRadialMenuDelegate> delegate;
@property (nonatomic, weak) id<YFDragRadialMenuDataSource> dataSource;

@property (nonatomic, strong) UIView *centerRadialView;  // 黑色的view(里面的小圆)

@property (nonatomic, strong) id radialMenuIdentifier;

-(id) initFromPoint:(CGPoint)centerPoint withDataSource:(id<YFDragRadialMenuDataSource>)dataSource andDelegate:(id<YFDragRadialMenuDelegate>)delegate;

-(void) showMenu;
-(void) showMenuWithCompletion:(void(^)()) completion;

-(void) closeMenu;
-(void) closeMenuWithCompletion:(void(^)()) completion;

@end




@class YFDragRadialMenu;

@protocol YFDragRadialMenuDataSource <NSObject>

-(NSInteger)numberOfButtonsForRadialMenu:(YFDragRadialMenu *)radialMenu;

-(UIButton *)radialMenu:(YFDragRadialMenu *)radialMenu elementAtIndex:(NSInteger)index;

@optional
-(BOOL) canDragRadialMenu:(YFDragRadialMenu *) radialMenu;

-(CGFloat)radiusLenghtForRadialMenu:(YFDragRadialMenu *)radialMenu;

-(UIView *)viewForCenterOfRadialMenu:(YFDragRadialMenu *)radialMenu;

-(void) radialMenu:(YFDragRadialMenu *)radialMenu customizationForRadialMenuView:(UIView *) radialMenuView;

@end


@protocol YFDragRadialMenuDelegate <NSObject>

-(void)radialMenu:(YFDragRadialMenu *)radialMenu didSelectButton:(UIButton *)button;

@end



