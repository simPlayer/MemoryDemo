//
//  YFAuthorBlogViewController.m
//  BigShow1949
//
//  Created by WangMengqi on 15/9/2.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import "YFBlogViewController.h"

@interface YFBlogViewController () {
    NSIndexPath             *_indexPath;
}
@end

@implementation YFBlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"唐巧",
                    @"王巍",
                    @"文顶顶",
                    @"池建强",
                    @"CocoaChina",
                    @"Code4App",
                    @"Git@OSC",
                    @"开源中国社区",
                    @"GitHub",
                    @"苹果Library"];
    
    self.classNames = @[@"http://blog.devtang.com/blog/archives/",
                        @"http://www.onevcat.com",
                        @"http://www.cnblogs.com/wendingding/p/",
                        @"http://macshuo.com",
                        @"http://www.cocoachina.com",
                        @"http://www.code4app.com",
                        @"http://git.oschina.net",
                        @"http://www.oschina.net/code/list",
                        @"https://github.com",
                        @"https://developer.apple.com/library/mac/navigation/"];
    
    //添加长按手势
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGR.minimumPressDuration = 0.5;
    [self.tableView addGestureRecognizer:longPressGR];
}


-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture {
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        CGPoint point = [gesture locationInView:self.tableView];
        _indexPath = [self.tableView indexPathForRowAtPoint:point];
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = self.classNames[_indexPath.row];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"链接复制完成"
                                                        message:pasteboard.string
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

@end
