//
//  YFRotateCircleMenuVC.m
//  BigShow1949
//
//  Created by WangMengqi on 15/9/1.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import "YFRotateCircleMenuVC.h"
#import "YFItemView.h"

#define RADIUS 100.0
#define PHOTONUM 5
#define TAGSTART 1000
#define TIME 1.5
#define SCALENUMBER 1.25
NSInteger array [PHOTONUM][PHOTONUM] = {
    {0,1,2,3,4},
    {4,0,1,2,3},
    {3,4,0,1,2},
    {2,3,4,0,1},
    {1,2,3,4,0}
};


@interface YFRotateCircleMenuVC ()<YFItemViewDelegate>
@property (nonatomic, assign) NSInteger currentTag;
@end



@implementation YFRotateCircleMenuVC

CATransform3D rotationTransform1[PHOTONUM];

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configViews];
}

#pragma mark - configViews
- (void)configViews {
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_background"]];
    NSArray *dataArray = @[@"exer_icon_biology", @"exer_icon_chemistry", @"exer_icon_chinese", @"exer_icon_english", @"exer_icon_geography"];
    
    CGFloat centery = self.view.center.y - 50;
    CGFloat centerx = self.view.center.x;

    for (NSInteger i = 0;i < PHOTONUM;i++) {
        CGFloat tmpy =  centery + RADIUS*cos(2.0*M_PI *i/PHOTONUM);
        CGFloat tmpx =	centerx - RADIUS*sin(2.0*M_PI *i/PHOTONUM);
        
        YFItemView *view = [[YFItemView alloc] initWithNormalImage:dataArray[i] highlightedImage:[dataArray[i] stringByAppendingFormat:@"%@", @"_hover"] tag:TAGSTART+i title:nil];
        view.frame = CGRectMake(0.0, 0.0,115,115);
        view.center = CGPointMake(tmpx,tmpy);
        view.delegate = self;
        rotationTransform1[i] = CATransform3DIdentity;
        
        CGFloat Scalenumber = fabs(i - PHOTONUM/2.0)/(PHOTONUM/2.0);  //  PHOTONUM/2.0 ?
        if (Scalenumber < 0.3) {
            Scalenumber = 0.4;
        }
        CATransform3D rotationTransform = CATransform3DIdentity;
        rotationTransform = CATransform3DScale (rotationTransform, Scalenumber*SCALENUMBER,Scalenumber*SCALENUMBER, 1);
        view.layer.transform=rotationTransform;
        [self.view addSubview:view];
        
    }
    self.currentTag = TAGSTART;
}

#pragma mark - YFItemViewDelegate
- (void)didTapped:(NSInteger)tag {
    
    NSLog(@"index === %d", tag);
    if (self.currentTag  == tag) {
        NSLog(@"自定义处理事件");
        return;
    }
    // 逆时针起第多少个
    NSInteger t = [self getItemViewTag:tag];
    NSLog(@"t = %d", t); // t=4 点击"化学"
    
    for (NSInteger i = 0; i < PHOTONUM; i++ ) {
        
        NSLog(@"i=%d, TAGSTART+i=%d, t=%d, tag=%d", i, TAGSTART+i, t, tag);
        UIView *view = [self.view viewWithTag:TAGSTART+i];
        [view.layer addAnimation:[self moveanimation:TAGSTART+i number:t] forKey:@"position"];
        [view.layer addAnimation:[self setscale:TAGSTART+i clicktag:tag] forKey:@"transform"];
        
        NSInteger j = array[tag - TAGSTART][i];
        CGFloat Scalenumber = fabs(j - PHOTONUM/2.0)/(PHOTONUM/2.0);
        if (Scalenumber < 0.3) {
            Scalenumber = 0.4;
        }
    }
    self.currentTag  = tag;
}

- (CAAnimation*)setscale:(NSInteger)tag clicktag:(NSInteger)clicktag {
    
    NSInteger i = array[clicktag - TAGSTART][tag - TAGSTART];
    NSInteger i1 = array[self.currentTag  - TAGSTART][tag - TAGSTART];
    CGFloat Scalenumber = fabs(i - PHOTONUM/2.0)/(PHOTONUM/2.0);
    CGFloat Scalenumber1 = fabs(i1 - PHOTONUM/2.0)/(PHOTONUM/2.0);
    if (Scalenumber < 0.3) {
        Scalenumber = 0.4;
    }
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = TIME;
    animation.repeatCount =1;
    
    CATransform3D dtmp = CATransform3DScale(rotationTransform1[tag - TAGSTART],Scalenumber*SCALENUMBER, Scalenumber*SCALENUMBER, 1.0);
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(rotationTransform1[tag - TAGSTART],Scalenumber1*SCALENUMBER,Scalenumber1*SCALENUMBER, 1.0)];
    animation.toValue = [NSValue valueWithCATransform3D:dtmp ];
    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

- (CAAnimation*)moveanimation:(NSInteger)tag number:(NSInteger)num { // 1000 4
    // CALayer
    UIView *view = [self.view viewWithTag:tag];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,view.layer.position.x,view.layer.position.y);
    
    NSInteger p = [self getItemViewTag:tag];
    NSLog(@"p = %d, tag = %d", p, tag);
    CGFloat f = 2.0*M_PI  - 2.0*M_PI *p/PHOTONUM;
    CGFloat h = f + 2.0*M_PI *num/PHOTONUM;
    CGFloat centery = self.view.center.y - 50;
    CGFloat centerx = self.view.center.x;
    CGFloat tmpy =  centery + RADIUS*cos(h);
    CGFloat tmpx =	centerx - RADIUS*sin(h);
    view.center = CGPointMake(tmpx,tmpy);
    
    CGPathAddArc(path,nil,self.view.center.x, self.view.center.y - 50,RADIUS,f+ M_PI/2,f+ M_PI/2 + 2.0*M_PI *num/PHOTONUM,0);
    animation.path = path;
    CGPathRelease(path);
    animation.duration = TIME;
    animation.repeatCount = 1;
    animation.calculationMode = @"paced";
    return animation;
}

- (NSInteger)getItemViewTag:(NSInteger)tag {
    
    NSLog(@"getItemViewTag=== self.currentTag == %d, tag == %d", self.currentTag, tag);
    if (self.currentTag >tag){
        
//        NSLog(@"马上返回if = %d", self.currentTag  - tag);
        return self.currentTag  - tag;
    } else {
//        NSLog(@"马上返回else = %d", self.currentTag  - tag);
        return PHOTONUM  - tag + self.currentTag ;
    }
}
@end



