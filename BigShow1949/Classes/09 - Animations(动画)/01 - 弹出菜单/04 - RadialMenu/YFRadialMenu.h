//
//  YFRadialMenu.h
//  BigShow1949
//
//  Created by WangMengqi on 15/9/2.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFRadialMenu;
@protocol YFRadialMenuDelegate <NSObject>

@optional

-(void)radialMenu:(YFRadialMenu *)radialMenu didSelectPopoutWithIndentifier: (NSString *) identifier;

-(BOOL)radialMenuShouldExpand:(YFRadialMenu *)radialMenu;
-(void)radialMenuDidExpand:(YFRadialMenu *)radialMenu;

-(BOOL)radialMenuShouldRetract:(YFRadialMenu *)radialMenu;
-(void)radialMenuDidRetract:(YFRadialMenu *)radialMenu;

@end




@interface YFRadialMenu : UIView

- (void) addPopoutView: (UIView *) popoutView withIndentifier: (NSString *) identifier;
- (UIView *) getPopoutViewWithIndentifier: (NSString *) identifier;
- (void) expand;
- (void) retract;
- (void) enableDevelopmentMode:(UIViewController *)superViewController;

@property (nonatomic, weak) NSObject<YFRadialMenuDelegate> *delegate;

@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) NSMutableArray *popoutViews;

@property CGFloat popoutViewSize;
@property CGFloat distanceFromCenter;
@property CGFloat distanceBetweenPopouts;
@property CGFloat startAngle;
@property CGFloat animationDuration;
@property NSTimeInterval stagger;

@property BOOL menuIsExpanded;

@end
