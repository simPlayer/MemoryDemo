//
//  YFFlipPageViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/17.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFFlipPageViewController.h"
#import "JCFlipPageView.h"
#import "JCFlipPage.h"

@interface YFFlipPageViewController ()<JCFlipPageViewDataSource>

@property (nonatomic, strong) JCFlipPageView *flipPage;

@end

@implementation YFFlipPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _flipPage = [[JCFlipPageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_flipPage];
    
    _flipPage.dataSource = self;
    [_flipPage reloadData];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mar - JCFlipPageViewDataSource
- (NSUInteger)numberOfPagesInFlipPageView:(JCFlipPageView *)flipPageView
{
    return 20;
}
- (JCFlipPage *)flipPageView:(JCFlipPageView *)flipPageView pageAtIndex:(NSUInteger)index
{
    static NSString *kPageID = @"numberPageID";
    JCFlipPage *page = [flipPageView dequeueReusablePageWithReuseIdentifier:kPageID];
    if (!page)
    {
        page = [[JCFlipPage alloc] initWithFrame:flipPageView.bounds reuseIdentifier:kPageID];
    }else{}
    
    if (index%3 == 0)
    {
        page.backgroundColor = [UIColor blueColor];
    }
    else if (index%3 == 1)
    {
        page.backgroundColor = [UIColor greenColor];
    }
    else if (index%3 == 2)
    {
        page.backgroundColor = [UIColor redColor];
    }else{}
    
    page.tempContentLabel.text = [NSString stringWithFormat:@"%d", index];
    
    return page;
}

#pragma mark -

- (void)showPage:(NSNumber *)pageNum
{
    [_flipPage flipToPageAtIndex:pageNum.integerValue animation:YES];
}


@end
