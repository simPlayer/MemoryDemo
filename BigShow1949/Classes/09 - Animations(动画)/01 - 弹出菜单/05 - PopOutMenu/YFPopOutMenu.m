//
//  YFPopOutMenu.m
//  BigShow1949
//
//  Created by WangMengqi on 15/9/2.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#define TRANSITION_DURATION  0.3
#define SCREENSHOT_QUALITY  0.75
#define FRAME_OFFSET 10

#import "YFPopOutMenu.h"

#pragma mark Category

@implementation UIView (ScreenShot)

-(UIImage*)screenShot{
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage * screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * imageData = UIImageJPEGRepresentation(screenImage, SCREENSHOT_QUALITY);
    screenImage = [UIImage imageWithData:imageData];
    return screenImage;
}

-(UIImage*)screenShotOnScrolViewWithContentOffset:(CGPoint)offset{
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, -offset.x, -offset.y);
    [self.layer renderInContext:context];
    UIImage * screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * imageData = UIImageJPEGRepresentation(screenImage, SCREENSHOT_QUALITY);
    screenImage = [UIImage imageWithData:imageData];
    return screenImage;
}

-(void)addTopBorderwithWidth:(CGFloat)width andColor:(CGColorRef)borderColor{
    CALayer *upperBorder = [CALayer layer];
    upperBorder.backgroundColor = borderColor;
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), width);
    [self.layer addSublayer:upperBorder];
}

@end

@implementation UIImage (Blur_and_Color_Filter)

-(UIImage*)blurWithRadius:(CGFloat)radius{
    radius =(radius<0)?0:radius;
    radius =(radius>4)?4:radius;
    CIImage * inputImage = [CIImage imageWithCGImage:self.CGImage];
    CIFilter * blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:inputImage forKey:@"inputImage"];
    [blurFilter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    CIImage * outputImage = [blurFilter outputImage];
    outputImage = [outputImage imageByCroppingToRect:[inputImage extent]];
    UIImage * blurImage = [UIImage imageWithCIImage:outputImage];
    return blurImage;
}

@end



#pragma mark YFPopoutMenuItem

@implementation YFPopoutMenuItem

-(instancetype)init{
    NSAssert(NO, @"Can't create with init");
    return nil;
}

-(instancetype)initWithTitle:(NSString *)title image:(UIImage *)image{
    if (self = [super init]) {
        _title = title;
        _image = image;
        self.font = [UIFont systemFontOfSize:14];
        self.textAligment = NSTextAlignmentCenter;
        self.tintColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end

#pragma mark YFPopoutMenuItemView

@interface YFPopoutMenuItemView : UIView
@property (nonatomic)UILabel * titleLabel;
@property (nonatomic)UIImage * image;
@property (nonatomic)UIImageView * iconIamageView;
@property (nonatomic)PopoutMenuStyle menuStyle;

@end

@implementation YFPopoutMenuItemView


-(instancetype)initWithMenuItem:(YFPopoutMenuItem*)item frame:(CGRect)frame menuStyle:(PopoutMenuStyle)menuStyle{
    if (self = [super init]) {
        self.menuStyle = menuStyle;
        self.backgroundColor = item.backgroundColor;
        
        
        if (item.title!=nil) {
            self.titleLabel = [UILabel new];
            [self.titleLabel setTextColor:item.tintColor];
            [self.titleLabel setTextAlignment:item.textAligment];
            self.titleLabel.backgroundColor = [UIColor clearColor];
            [self.titleLabel setText:item.title];
            [self.titleLabel setFont:item.font];
            [self addSubview:self.titleLabel];
        }
        
        if (item.image!=nil) {
            self.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            self.iconIamageView = [UIImageView new];
            self.iconIamageView.image = self.image;
            [self.iconIamageView setTintColor:item.tintColor];
            self.iconIamageView.backgroundColor = [UIColor clearColor];
            [self.iconIamageView setContentMode:UIViewContentModeScaleAspectFit];
            [self addSubview:self.iconIamageView];
        }
        
        self.frame = frame;
    }
    return self;
}


-(void)layoutSubviews{
    switch (self.menuStyle) {
        case MenuStyleDefault:
            [self layoutMenuItemViewasDefault];
            break;
        case MenuStyleList:
            [self layoutMenuItemViewasList];
            break;
        case MenuStyleOval:
            [self layoutMenuItemViewasOval];
            break;
        case MenuStyleGrid:
            [self layoutMenuItemViewasGrid];
            break;
    }
}

-(void)layoutMenuItemViewasDefault{
    CGSize imageSize;
    if (self.iconIamageView!= nil) {
        imageSize = CGSizeMake(self.bounds.size.height*0.9, self.bounds.size.height*0.9);
        self.iconIamageView.frame = CGRectMake(self.bounds.size.width*0.05, self.bounds.size.height*0.05, imageSize.width, imageSize.height);
    }else{
        imageSize = CGSizeMake(0, 0);
    }
    CGSize labelSize;
    if (self.titleLabel!=nil) {
        labelSize = CGSizeMake((self.bounds.size.width*0.9 - imageSize.width), self.bounds.size.height*0.9);
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.iconIamageView.frame), self.bounds.size.height*0.05, labelSize.width, labelSize.height);
    }else{
        labelSize = CGSizeMake(0, 0);
    }
    
    
    if (self.iconIamageView == nil) {
        self.titleLabel.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    }
    if (self.titleLabel == nil) {
        self.iconIamageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    }
    
}

-(void)layoutMenuItemViewasList{
    [self layoutMenuItemViewasDefault];
}

-(void)layoutMenuItemViewasOval{
    CGSize labelSize;
    if (self.titleLabel!= nil) {
        labelSize = [self.titleLabel sizeThatFits:(CGSize){self.bounds.size.width*0.9,CGFLOAT_MAX}];
    }else{
        labelSize = CGSizeMake(0, 0);
    }
    labelSize.width = self.bounds.size.width*0.9;
    CGSize imageSize;
    if (self.iconIamageView!=nil) {
        imageSize = CGSizeMake(self.bounds.size.width*0.7, self.bounds.size.height-labelSize.height-5);
        self.iconIamageView.frame = CGRectMake(self.bounds.size.width*0.15, self.bounds.size.height*0.05, imageSize.width, imageSize.height);
        self.titleLabel.frame = CGRectMake(self.bounds.size.width*0.05, CGRectGetMaxY(self.iconIamageView.frame), labelSize.width, labelSize.height);
    }else{
        self.iconIamageView = nil;
        self.titleLabel.frame = CGRectMake(self.bounds.size.width*0.05, CGRectGetMaxY(self.iconIamageView.frame), labelSize.width, labelSize.height);
        self.titleLabel.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    }
    
}

-(void)layoutMenuItemViewasGrid{
    [self layoutMenuItemViewasOval];
}

-(void)dealloc{
    //    NSLog(@"%@ has been dealloc",self.titleLabel.text);
}

@end

#pragma mark YFPopoutMenu

@interface YFPopoutMenu ()

@property (nonatomic)UIImageView * blurView;
@property (nonatomic)CGPoint menuCenter;
@property (nonatomic)NSMutableArray * itemViews;
@property (nonatomic)UITextView * messageView, * titleView;
@property (nonatomic)YFPopoutMenuItemView * selectedItemView;
@property (nonatomic)YFPopoutMenuItem * selectedItem;

@end

@implementation YFPopoutMenu

#pragma mark -LifeCycle

-(instancetype)init{
    NSAssert(NO, @"Can't create with init");
    return nil;
}

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message items:(NSArray *)items{
    if (self = [super init]) {
        _items = items;
        _titleText = title;
        _messageText = message;
        _menuView = [UIView new];
        self.textAligment = NSTextAlignmentCenter;
        self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.titleFont = [UIFont systemFontOfSize:[UIFont systemFontSize]+3];
        self.messageFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.85];
        self.tintColor = [UIColor whiteColor];
        self.highlightColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        self.borderColor = [UIColor whiteColor].CGColor;
        self.borderWidth = 2;
        self.borderRadius = 5;
        self.blurLevel = 3.5;
        self.menuStyle = MenuStyleDefault;
        
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message images:(NSArray *)images{
    NSMutableArray * items = [NSMutableArray new];
    [images enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        YFPopoutMenuItem * item = [[YFPopoutMenuItem alloc]initWithTitle:nil image:(UIImage*)obj];
        [items addObject:item];
    }];
    return [self initWithTitle:title message:message items:items];
}

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message itemTitles:(NSArray *)itemTitles{
    NSMutableArray * items = [NSMutableArray new];
    [itemTitles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        YFPopoutMenuItem * item = [[YFPopoutMenuItem alloc]initWithTitle:(NSString*)obj image:nil];
        [items addObject:item];
    }];
    return [self initWithTitle:title message:message items:items];
}

#pragma mark -Private

-(void)YF_addToParentVC:(UIViewController*)parentVC withAnimation:(BOOL)animate{
    [parentVC addChildViewController:self];
    [parentVC.view addSubview:self.view];
}

-(void)YF_removeFromParentVCwithAnimation:(BOOL)animate{
    self.menuView.transform = CGAffineTransformIdentity;
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
    [self.blurView removeFromSuperview];
    self.blurView = nil;
}

-(CGPoint)YF_centroidOfTouches:(NSSet*)touches inVeiw:(UIView*)view{
    CGFloat sumX;
    CGFloat sumY;
    for (UITouch * touch in touches) {
        CGPoint loc = [touch locationInView:view];
        sumX += loc.x;
        sumY += loc.y;
    }
    return CGPointMake(sumX/[touches count], sumY/[touches count]);
}

-(YFPopoutMenuItemView*)itemViewatPoint:(CGPoint)point{
    YFPopoutMenuItemView * selectedItemView = nil;
    YFPopoutMenuItem * selectedItem = nil;
    if (CGRectContainsPoint(self.menuView.frame, point)) {
        point = [self.view convertPoint:point toView:self.menuView];
        selectedItemView = [self.itemViews filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(YFPopoutMenuItemView * itemView, NSDictionary *bindings) {
            return CGRectContainsPoint(itemView.frame, point);
        }]].lastObject;
    }
    if (selectedItemView!=nil) {
        selectedItem = [self.items objectAtIndex:[self.itemViews indexOfObject:selectedItemView]];
        selectedItemView.backgroundColor = self.highlightColor;
        if (self.selectedItemView != selectedItemView) {
            self.selectedItemView.backgroundColor = self.selectedItem.backgroundColor;
            self.selectedItemView = selectedItemView;
            self.selectedItem = selectedItem;
        }
    }else{
        self.selectedItemView.backgroundColor = self.selectedItem.backgroundColor;
        self.selectedItemView = nil;
        self.selectedItem = nil;
    }
    
    return selectedItemView;
}

#pragma mark -Animation

-(void)showMenuInParentViewController:(UIViewController *)parentVC withCenter:(CGPoint)center{
    [self YF_addToParentVC:parentVC withAnimation:YES];
    self.menuCenter = center;
    self.view.frame = parentVC.view.bounds;
    self.blurView = [[UIImageView alloc]init];
    [self.view addSubview:self.blurView];
    [self createScreenshotwithComleteAYFion:^{
        [self layoutMenuView];
    }];
}

-(void)dismissMenu{
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.75 options:0 animations:^{
        if (self.menuView.superview!=nil) {
            self.menuView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        }
    } completion:^(BOOL finished) {
        [self YF_removeFromParentVCwithAnimation:YES];
    }];
}

-(void)createScreenshotwithComleteAYFion:(dispatch_block_t)completeAYFion{
    self.blurView.frame = self.view.bounds;
    self.blurView.alpha = 0.0;
    self.menuView.alpha = 0.0;
    UIImage * screenshot = nil;
    if ([self.parentViewController.view isKindOfClass:[UIScrollView class]]) {
        screenshot = [self.parentViewController.view screenShotOnScrolViewWithContentOffset:[(UIScrollView*)self.parentViewController.view contentOffset]];
    }else{
        screenshot = [self.parentViewController.view screenShot];
    }
    self.blurView.alpha = 1.0;
    self.menuView.alpha = 1.0;
    if (self.blurLevel >0.0) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage * blurImage = [screenshot blurWithRadius:self.blurLevel];
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition * transition = [CATransition animation];
                transition.duration = TRANSITION_DURATION;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                transition.type = kCATransitionFade;
                
                self.blurView.image = blurImage;
                [self.blurView.layer addAnimation:transition forKey:@"showBlurView"];
                [self.view setNeedsLayout];
                if (completeAYFion != nil) {
                    completeAYFion();
                }
                
                [self.view setNeedsLayout];
                [self.view layoutIfNeeded];
            });
        });
    }else{
        self.blurView.image = screenshot;
        if (completeAYFion != nil) {
            completeAYFion();
        }
    }
}


#pragma mark -Layout


-(void)layoutMenuView{
    self.itemViews = [NSMutableArray new];
    
    self.menuView.backgroundColor = _backgroundColor;
    self.menuView.layer.borderWidth = self.borderWidth;
    self.menuView.layer.borderColor = self.borderColor;
    self.menuView.layer.cornerRadius = self.borderRadius;
    self.menuView.layer.masksToBounds = YES;
    
    self.titleView = [UITextView new];
    self.titleView.userInteractionEnabled = NO;
    self.titleView.backgroundColor = [UIColor clearColor];
    [self.titleView setTextAlignment:self.textAligment];
    [self.titleView setTextColor:self.tintColor];
    [self.titleView setText:self.titleText];
    [self.titleView setFont:self.titleFont];
    
    self.messageView = [UITextView new];
    self.messageView.userInteractionEnabled = NO;
    self.messageView.backgroundColor = [UIColor clearColor];
    [self.messageView setTextAlignment:self.textAligment];
    [self.messageView setTextColor:self.tintColor];
    [self.messageView setText:self.messageText];
    [self.messageView setFont:self.messageFont];
    
    switch (self.menuStyle) {
        case MenuStyleList:
            [self layoutasList];
            break;
        case MenuStyleOval:
            [self layoutasOval];
            break;
        case MenuStyleGrid:
            [self layoutasGrid];
            break;
        default:
            [self layoutasDefault];
            break;
    }
    
    [self.view addSubview:self.menuView];
    self.menuView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.75 options:0 animations:^{
        self.menuView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        self.menuView.transform = CGAffineTransformMakeScale(1, 1);
        self.activityIndicator.center = CGPointMake(self.menuView.bounds.size.width/2, self.menuView.bounds.size.height/2);
        [self.menuView addSubview:self.activityIndicator];
    }];
}

-(void)layoutasDefault{
    CGFloat menuWidth = (self.view.bounds.size.width<self.view.bounds.size.height)?self.view.bounds.size.width*0.8:self.view.bounds.size.height*0.8;
    [self layoutTitleandMessagewithMenuWidth:menuWidth];
    
    CGFloat offSetY = CGRectGetMaxY(self.messageView.frame)+FRAME_OFFSET;
    NSInteger colCount = ceilf(sqrtf([self.items count]));
    NSInteger rowCount = ceilf([self.items count]/(CGFloat)colCount);
    CGFloat itemWidth = menuWidth/colCount;
    CGSize itemSize = CGSizeMake(itemWidth, 40);
    [self.items enumerateObjectsUsingBlock:^(YFPopoutMenuItem * obj, NSUInteger idx, BOOL *stop) {
        NSUInteger index = idx;
        while (index >= colCount) {
            index -= colCount;
        }
        NSUInteger rowIndex = floorf((CGFloat)idx/colCount);
        YFPopoutMenuItemView * itemView = nil;
        if (idx >= [self.items count]-([self.items count]%colCount)) {
            CGFloat rowLength = [self.items count]%colCount*itemSize.width;
            CGFloat offSetX = (menuWidth - rowLength)/2;
            itemView = [[YFPopoutMenuItemView alloc]initWithMenuItem:obj
                                                               frame:CGRectMake(offSetX+index*itemSize.width, offSetY+rowIndex*itemSize.height,
                                                                                itemSize.width, itemSize.height)
                                                           menuStyle:self.menuStyle];
        }else{
            itemView = [[YFPopoutMenuItemView alloc]initWithMenuItem:obj
                                                               frame:CGRectMake(index*itemSize.width, offSetY+rowIndex*itemSize.height,
                                                                                itemSize.width, itemSize.height)
                                                           menuStyle:self.menuStyle];
        }
        [self.menuView addSubview:itemView];
        [self.itemViews addObject:itemView];
    }];
    
    self.menuView.frame = [self menuFramewithWidth:menuWidth
                                            Height:offSetY + rowCount*itemSize.height+FRAME_OFFSET
                                            Center:self.menuCenter];
    [self.menuView addSubview:self.titleView];
    [self.menuView addSubview:self.messageView];
    
}

-(void)layoutasList{
    CGFloat menuWidth = (self.view.bounds.size.width<self.view.bounds.size.height)?self.view.bounds.size.width*0.75:self.view.bounds.size.height*0.75;
    [self layoutTitleandMessagewithMenuWidth:menuWidth];
    
    CGSize itemSize = CGSizeMake(menuWidth*0.8, 45);
    CGFloat offSetY = CGRectGetMaxY(self.messageView.frame)+FRAME_OFFSET;
    CGFloat offSetX = menuWidth * 0.1;
    [self.items enumerateObjectsUsingBlock:^(YFPopoutMenuItem*obj, NSUInteger idx, BOOL *stop) {
        YFPopoutMenuItemView * itemView = [[YFPopoutMenuItemView alloc]initWithMenuItem:obj frame:CGRectMake(offSetX, offSetY+idx*itemSize.height, itemSize.width, itemSize.height) menuStyle:self.menuStyle];
        [itemView addTopBorderwithWidth:self.borderWidth/4 andColor:self.borderColor];
        [self.menuView addSubview:itemView];
        [self.itemViews addObject:itemView];
    }];
    self.menuView.frame = [self menuFramewithWidth:menuWidth
                                            Height:offSetY+self.items.count*itemSize.height Center:self.menuCenter];
    [self.menuView addSubview:self.titleView];
    [self.menuView addSubview:self.messageView];
    
}

-(void)layoutasOval{
    CGFloat menuWidth = (self.view.bounds.size.width<self.view.bounds.size.height)?self.view.bounds.size.width*0.9:self.view.bounds.size.height*0.9;
    CGFloat radius = menuWidth*0.8/2;
    [self layoutTitleandMessagewithMenuWidth:menuWidth];
    
    CGSize itemSize = CGSizeMake(menuWidth*0.2, menuWidth*0.2);
    CGFloat identicalAngle = 2*M_PI / [self.items count];
    
    self.menuView.frame = [self menuFramewithWidth:menuWidth Height:menuWidth Center:self.menuCenter];
    CGPoint center = CGPointMake(self.menuView.bounds.size.width/2, self.menuView.bounds.size.height/2);
    
    self.menuView.layer.borderWidth = 0;
    CAShapeLayer * circleLayer = [CAShapeLayer new];
    [circleLayer setPosition:center];
    [circleLayer setBounds:self.menuView.bounds];
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:self.menuView.bounds];
    [circleLayer setPath:path.CGPath];
    self.menuView.layer.mask = circleLayer;
    
    
    
    [self.items enumerateObjectsUsingBlock:^(YFPopoutMenuItem * obj, NSUInteger idx, BOOL *stop) {
        CGFloat angle = idx*identicalAngle;
        YFPopoutMenuItemView * itemView = [[YFPopoutMenuItemView alloc]initWithMenuItem:obj frame:CGRectMake(0, 0, itemSize.width, itemSize.height) menuStyle:self.menuStyle];
        itemView.center = CGPointMake(center.x + cosf(angle)*radius, center.y + sinf(angle)*radius);
        [self.menuView addSubview:itemView];
        [self.itemViews addObject:itemView];
    }];
    
    
    self.titleView.center = CGPointMake(self.menuView.bounds.size.width/2,
                                        self.menuView.bounds.size.height/2 - (self.titleView.bounds.size.height)/2);
    self.messageView.center = CGPointMake(self.menuView.bounds.size.width/2,
                                          self.menuView.bounds.size.height/2 + (self.messageView.bounds.size.height)/2);
    [self.menuView addSubview:self.titleView];
    [self.menuView addSubview:self.messageView];
    
}

-(void)layoutasGrid{
    CGFloat menuWidth = (self.view.bounds.size.width<self.view.bounds.size.height)?self.view.bounds.size.width*0.75:self.view.bounds.size.height*0.75;
    [self layoutTitleandMessagewithMenuWidth:menuWidth];
    
    CGFloat offSetY = CGRectGetMaxY(self.messageView.frame)+FRAME_OFFSET;
    NSInteger colCount = ceilf(sqrtf([self.items count]));
    NSInteger rowCount = ceilf([self.items count]/(CGFloat)colCount);
    CGFloat itemWidth = menuWidth/colCount;
    CGSize itemSize = CGSizeMake(itemWidth, itemWidth);
    [self.items enumerateObjectsUsingBlock:^(YFPopoutMenuItem * obj, NSUInteger idx, BOOL *stop) {
        NSUInteger index = idx;
        while (index >= colCount) {
            index -= colCount;
        }
        NSUInteger rowIndex = floorf((CGFloat)idx/colCount);
        YFPopoutMenuItemView * itemView = nil;
        if (idx >= [self.items count]-([self.items count]%colCount)) {
            CGFloat rowLength = [self.items count]%colCount*itemSize.width;
            CGFloat offSetX = (menuWidth - rowLength)/2;
            itemView = [[YFPopoutMenuItemView alloc]initWithMenuItem:obj
                                                               frame:CGRectMake(offSetX+index*itemSize.width, offSetY+rowIndex*itemSize.height,
                                                                                itemSize.width, itemSize.height)
                                                           menuStyle:self.menuStyle];
        }else{
            itemView = [[YFPopoutMenuItemView alloc]initWithMenuItem:obj
                                                               frame:CGRectMake(index*itemSize.width, offSetY+rowIndex*itemSize.height,
                                                                                itemSize.width, itemSize.height)
                                                           menuStyle:self.menuStyle];
        }
        [self.menuView addSubview:itemView];
        [self.itemViews addObject:itemView];
    }];
    
    self.menuView.frame = [self menuFramewithWidth:menuWidth
                                            Height:offSetY + rowCount*itemSize.height+FRAME_OFFSET
                                            Center:self.menuCenter];
    [self.menuView addSubview:self.titleView];
    [self.menuView addSubview:self.messageView];
    
}

-(void)layoutTitleandMessagewithMenuWidth:(CGFloat)menuWidth{
    CGSize titleSize;
    CGSize messageSize;
    if (self.menuStyle == MenuStyleOval) {
        if (self.titleText != nil) {
            titleSize = [self.titleView sizeThatFits:(CGSize){menuWidth*0.55,CGFLOAT_MAX}];
            titleSize.width = menuWidth*0.55;
        }else{
            titleSize = CGSizeMake(0, 0);
        }
        if (self.messageText != nil) {
            messageSize = [self.messageView sizeThatFits:(CGSize){menuWidth*0.55,CGFLOAT_MAX}];
            messageSize.width = menuWidth*0.55;
        }else{
            messageSize = CGSizeMake(0, 0);
        }
        
    }else{
        if (self.titleText != nil) {
            titleSize = [self.titleView sizeThatFits:(CGSize){menuWidth*0.9,CGFLOAT_MAX}];
            titleSize.width = menuWidth*0.9;
        }else{
            titleSize = CGSizeMake(0, 0);
        }
        if (self.messageText != nil) {
            messageSize = [self.messageView sizeThatFits:(CGSize){menuWidth*0.8,CGFLOAT_MAX}];
            messageSize.width = menuWidth*0.8;
        }else{
            messageSize = CGSizeMake(0, 0);
        }
    }
    self.titleView.scrollEnabled = NO;
    self.titleView.frame = CGRectMake(menuWidth*0.05, FRAME_OFFSET, titleSize.width, titleSize.height);
    
    self.messageView.scrollEnabled = NO;
    self.messageView.frame = CGRectMake(menuWidth*0.1,
                                        CGRectGetMaxY(self.titleView.frame)+FRAME_OFFSET, messageSize.width, messageSize.height);
}

-(CGRect)menuFramewithWidth:(CGFloat)width Height:(CGFloat)height Center:(CGPoint)center{
    CGFloat originX = ((center.x-width/2)<0)?0:(center.x-width/2);
    originX = ((center.x-width/2)>(self.view.bounds.size.width-width))?
    (self.view.bounds.size.width-width):(originX);
    CGFloat originY = ((center.y-height/2)<0)?0:(center.y-height/2);
    originY = ((center.y-height/2)>(self.view.bounds.size.height-height))?
    (self.view.bounds.size.height-height):(originY);
    CGRect frame = CGRectMake(originX,originY,width,height);
    return frame;
}

#pragma mark -ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter * defaultCenter=[NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(OrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.activityIndicator stopAnimating];
    [self.menuView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    self.menuView.layer.mask = nil;
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    [self.itemViews removeAllObjects];
    self.itemViews = nil;
    self.titleView = nil;
    self.messageView = nil;
}

-(void)dealloc{
    
}

#pragma mark -Rotation

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

-(BOOL)shouldAutorotate{
    return [self.parentViewController shouldAutorotate];
}

-(void)OrientationDidChange:(NSNotification*)notification{
    CGFloat newCenterX = self.menuCenter.y;
    CGFloat newCenterY = self.menuCenter.x;
    self.menuCenter = CGPointMake(newCenterX, newCenterY);
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    if (toInterfaceOrientation!= UIDeviceOrientationPortraitUpsideDown) {
        if ([self isViewLoaded] && self.view.window != nil) {
            [self createScreenshotwithComleteAYFion:^{
                self.menuView.frame = [self menuFramewithWidth:self.menuView.bounds.size.width
                                                        Height:self.menuView.bounds.size.height
                                                        Center:self.menuCenter];
            }];
        }
    }
}

#pragma mark -Touch

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point = [self YF_centroidOfTouches:touches inVeiw:self.view];
    [self itemViewatPoint:point];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point = [self YF_centroidOfTouches:touches inVeiw:self.view];
    [self itemViewatPoint:point];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point = [self YF_centroidOfTouches:touches inVeiw:self.view];
    [self itemViewatPoint:point];
    if (self.selectedItemView != nil) {
        NSUInteger index = [self.itemViews indexOfObject:self.selectedItemView];
        if ([self.delegate respondsToSelector:@selector(menu:willDismissWithSelectedItemAtIndex:)]) {
            [self.delegate menu:self willDismissWithSelectedItemAtIndex:index];
        }
        [self dismissMenu];
    }else{
        if (!CGRectContainsPoint(self.menuView.frame, point)) {
            if ([self.delegate respondsToSelector:@selector(menuwillDismiss:)]) {
                [self.delegate menuwillDismiss:self];
            }
            [self dismissMenu];
        }
    }
}


@end
