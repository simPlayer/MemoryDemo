//
//  YFDataPersistenceViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/4/5.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFDataPersistenceViewController.h"

@interface YFDataPersistenceViewController ()

@end

@implementation YFDataPersistenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[@"JKDBModel(错误)",
                    @"FMDB基本使用",
                    @"SQLite基本使用",
                    @"LCCSqliteManager"];
    
    self.classNames = @[@"JKDBViewController_UIStoryboard",
                        @"FMDBBaseUseViewController_UIStoryboard",
                        @"SQLiteBaseUseViewController_UIStoryboard",
                        @"SheetListController"];
}


@end
