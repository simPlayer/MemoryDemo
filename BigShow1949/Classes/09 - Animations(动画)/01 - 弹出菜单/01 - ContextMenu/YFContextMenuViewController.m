//
//  YFContextMenuViewController.m
//  BigShow1949
//
//  Created by WangMengqi on 15/9/1.
//  Copyright (c) 2015年 BigShowCompany. All rights reserved.
//

#import "YFContextMenuViewController.h"

#import "ContextMenuCell.h"
#import "YFContextMenuTableView.h"

static NSString *const menuCellIdentifier = @"rotationCell";

@interface YFContextMenuViewController ()<UITableViewDataSource,UITableViewDelegate,YFContextMenuTableViewDelegate>

@property (nonatomic, strong) YFContextMenuTableView *contextMenuTableView;

@property (nonatomic, strong) NSArray *menuTitles;
@property (nonatomic, strong) NSArray *menuIcons;
@end

@implementation YFContextMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initiateMenuOptions];
    [self initNav];
    self.view.backgroundColor = [UIColor blueColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource & UITableViewDelegate

- (void)tableView:(YFContextMenuTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView dismisWithIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuTitles.count;
}

- (UITableViewCell *)tableView:(YFContextMenuTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContextMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentifier forIndexPath:indexPath];
    
    if (cell) {
        cell.menuTitleLabel.text = [self.menuTitles objectAtIndex:indexPath.row];
        cell.menuImageView.image = [self.menuIcons objectAtIndex:indexPath.row];
    }
    
    return cell;
}



#pragma mark - private
- (void)initiateMenuOptions {
    self.menuTitles = @[@"",
                        @"Send message",
                        @"Like profile",
                        @"Add to friends",
                        @"Add to favourites",
                        @"Block user"];
    
    self.menuIcons = @[[UIImage imageNamed:@"Icnclose"],
                       [UIImage imageNamed:@"SendMessageIcn"],
                       [UIImage imageNamed:@"LikeIcn"],
                       [UIImage imageNamed:@"AddToFriendsIcn"],
                       [UIImage imageNamed:@"AddToFavouritesIcn"],
                       [UIImage imageNamed:@"BlockUserIcn"]];
}

- (void)initNav {

    self.title = @"逐渐弹出菜单";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"按钮" style:UIBarButtonItemStylePlain target:self action:@selector(menuClick)];

}

- (void)menuClick {

    [self.contextMenuTableView showInView:self.navigationController.view withEdgeInsets:UIEdgeInsetsZero animated:YES];
    
}

#pragma mark - 懒加载

- (YFContextMenuTableView *)contextMenuTableView {

    if (!_contextMenuTableView) {
        _contextMenuTableView = [[YFContextMenuTableView alloc] initWithTableViewDelegateDataSource:self];
        _contextMenuTableView.animationDuration = 0.1;
        _contextMenuTableView.delegate = self;
        
        //register nib
        UINib *cellNib = [UINib nibWithNibName:@"ContextMenuCell" bundle:nil];
        [_contextMenuTableView registerNib:cellNib forCellReuseIdentifier:menuCellIdentifier];
    }
    return _contextMenuTableView;
}
@end
