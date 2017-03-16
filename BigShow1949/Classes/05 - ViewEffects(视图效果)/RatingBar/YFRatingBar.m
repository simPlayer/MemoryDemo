//
//  YFRatingBar.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/24.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFRatingBar.h"
#import "YFStar.h"

#define defaultStarCount 5
@interface YFRatingBar()
@property (nonatomic, strong) YFStar *star;

//@property (nonatomic, assign) CGFloat *starWH;

@end

@implementation YFRatingBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        _miniSelectNumber = 1;
        _starTotalNumber = defaultStarCount;
        _starSelectNumber = _starTotalNumber;

        
       self.enable = YES;
        self.scrollSelectEnable = YES;
        // bt_star_a bt_star_b
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:tap];
        [self addGestureRecognizer:pan];
        
        // 默认星星个数:5
        [self makeStarWithCount:self.starTotalNumber];

        
    }
    return self;
}


- (void)makeStarWithCount:(NSInteger)count {
    
    NSLog(@"subviews = %@", self.subviews);
    if (self.subviews.count) {   // 全部删除
        for (YFStar *star in self.subviews) {
            [star removeFromSuperview];
        }
    }
    
    CGFloat starWH = self.frame.size.height; // star 的宽高就是 YFRatingBar的高度
    for(int i = 0; i < count; i++) {
        YFStar *star = [[YFStar alloc] initWithFrame:CGRectMake(starWH * i, 0, starWH, starWH)];
        self.star = star;
        [self addSubview:star];
    }
 
 
}


-(void)setViewColor:(UIColor *)backgroundColor{
    if(_viewColor!=backgroundColor){
        self.backgroundColor = backgroundColor;

    }
}


-(void)tap:(UITapGestureRecognizer *)gesture{
    if(self.enable){
        CGPoint point = [gesture locationInView:self];
        NSInteger count = (int)(point.x/self.frame.size.height) + 1;
        count = count < self.miniSelectNumber ? self.miniSelectNumber : count;
        self.starSelectNumber = count > self.starTotalNumber ? self.starTotalNumber : count;

    }
}
-(void)pan:(UIPanGestureRecognizer *)gesture{
    if(self.enable && self.scrollSelectEnable){
        CGPoint point = [gesture locationInView:self];
        NSInteger count = (int)(point.x/self.frame.size.height) + 1;
        count = count < self.miniSelectNumber ? self.miniSelectNumber : count; // 最小选择数的左右边

        if(count>=0 && count<=self.starTotalNumber && self.starSelectNumber!=count){
            self.starSelectNumber = count;
        }
        
    }
}

- (void)setStarSelectNumber:(NSInteger)starSelectNumber {

    _starSelectNumber = starSelectNumber;
    
    // 设置最小分数
    if (starSelectNumber < self.miniSelectNumber) {
        return;
    }
    
    // 告诉star改变图片
    for (NSUInteger i = 0; i < self.subviews.count; i++) {  // count 4 5
        
        YFStar *star = self.subviews[i];
        star.select = i < starSelectNumber ? YES : NO;
        
    }
    // 选择几个就有几分
    _scale = starSelectNumber;
}


- (void)setStarTotalNumber:(NSInteger)starTotalNumber {

    
    if (_starTotalNumber != starTotalNumber) {
        _starTotalNumber = starTotalNumber;
        
        // 改变星星个数
        [self makeStarWithCount:starTotalNumber];
//        // 默认全部选择 Q:如果先设置选中数, 再设置总数就错了
//        self.starSelectNumber = starTotalNumber;
        // 默认选中数,就是默认总数, 也就是5
        NSLog(@"starSelectNumber = %zd", self.starSelectNumber);
        if (self.starSelectNumber != defaultStarCount) { // 说明设置星星总数前,就修改了默认选中数
            
            [self setStarSelectNumber:self.starSelectNumber];  // 默认都是选中的图片, 重置图片
        }else {
            self.starSelectNumber = starTotalNumber;
        }
    }
}
//
//- (void)setMiniSelectNumber:(NSInteger)miniSelectNumber {
//
//    _miniSelectNumber = miniSelectNumber;
//    
//
//    [self judgeStarValid];
//    
//}


@end





