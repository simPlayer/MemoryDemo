//
//  YFHealineViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFHealineViewController.h"

@interface YFHealineViewController ()

@end

@implementation YFHealineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@ -- viewDidLoad", self.title);
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"news";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ -- 数据", self.title];
    return cell;
}
@end

