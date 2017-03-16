//
//  YFEmptyDataSetViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/4/5.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFEmptyDataSetViewController.h"
#import "GzwTableViewLoading.h"
@interface YFEmptyDataSetViewController ()
@property (nonatomic,strong) NSMutableArray *data;
@end

@implementation YFEmptyDataSetViewController
-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 如果出现加载菊花和tableView重复出现的话，就设置FooterView，因为tableView默认对没有数据的列表也会显示cell
    self.tableView.tableFooterView = [UIView new];
    
    // 配置参数
//    self.tableView.buttonText = @"再次请求";
//    self.tableView.buttonNormalColor = [UIColor redColor];
//    self.tableView.buttonHighlightColor = [UIColor yellowColor];
//    self.tableView.loadedImageName = @"58x58";
//    self.tableView.descriptionText = @"破网络，你还是再请求一次吧";
//    self.tableView.dataVerticalOffset = 200;
    
    // 点击响应
    [self.tableView gzwLoading:^{
        NSLog(@"再点我就肛你");
        [self loadingData:NO];
    }];
}
// 有数据
- (IBAction)loadData:(id)sender {
    [self loadingData:YES];
}
// 没数据
- (IBAction)noData:(id)sender {
    [self loadingData:NO];
}
-(void)loadingData:(BOOL)data
{
    if (self.data.count > 0) {
        [self.data removeAllObjects];
        [self.tableView reloadData];
    }
    
    // 只需一行代码，我来解放你的代码
    self.tableView.loading = YES;
    
    // 模拟延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (data) {
            for (int i = 0; i < 10; i++) {
                [self.data addObject:[NSString stringWithFormat:@"I'm data，fuck！"]];
            }
        }else {// 无数据时
            self.tableView.loading = NO;
        }
        [self.tableView reloadData];
    });
}







-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}
@end
