//
//  YFLazyInViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFLazyInViewController.h"
#import "LazyFadeInView.h"

static NSString * const kStrayBirds = @"Stray birds of summer come to my window to sing and fly away. And yellow leaves of autumn, which have no songs, flutter and fall there with a sign. O Troupe of little vagrants of the world, leave your footprints in my words.";

static NSString * const kChinesePoem = @"惟江上之清风，与山间之明月，耳得之而为声，目遇之而成色。取之无禁，用之不竭。是造物者之无尽藏也，而吾与子之所共适。";

@interface YFLazyInViewController ()

@property (strong, nonatomic) LazyFadeInView *fadeInView;
@property (assign, nonatomic) BOOL flag;

@end

@implementation YFLazyInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.fadeInView = [[LazyFadeInView alloc] initWithFrame:CGRectMake(20, 120, 280, 200)];
    //    self.fadeInView.text = kStrayBirds;
    [self.view addSubview:self.fadeInView];
}

- (IBAction)setTextBtnClicked:(id)sender
{
    if (_flag)
    {
        self.fadeInView.text = kStrayBirds;
        _flag = !_flag;
    }
    else
    {
        self.fadeInView.text = kChinesePoem;
        _flag = !_flag;
    }
}

- (IBAction)colorSwitched:(id)sender
{
    if (((UISwitch *)sender).on == YES)
    {
        self.view.backgroundColor = [UIColor colorWithRed:0.24 green:0.48 blue:0.82 alpha:1];
    }
    else
    {
        self.view.backgroundColor = [UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
