//
//  YFStar.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/24.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFStar.h"

#define kScale 0.6
@interface YFStar()
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation YFStar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeView:frame];
    }
    return self;
}

- (void)makeView:(CGRect)frame {

    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bt_star_b"]];
    self.imgView = imgView;
    [self addSubview:imgView];
    
    CGFloat imgWH = frame.size.width;
    imgView.frame = CGRectMake(0, 0, imgWH * kScale, imgWH * kScale);
    imgView.center = CGPointMake(imgWH * 0.5, imgWH * 0.5);
    
}

- (void)setSelect:(BOOL)select {

    NSString *imgName;
    if (select) {
        imgName = @"bt_star_b";
    }else {
        imgName = @"bt_star_a";
    }
    
    [self.imgView setImage:[UIImage imageNamed:imgName]];
}

@end
