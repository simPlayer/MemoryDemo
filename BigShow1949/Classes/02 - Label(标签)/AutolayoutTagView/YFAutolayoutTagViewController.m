//
//  YFAutolayoutTagViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFAutolayoutTagViewController.h"
#import "SKTagView.h"
//#import <Masonry/Masonry.h>
//#import <HexColors/HexColors.h>
#import "UIColor+Extension.h"
#import "Masonry.h"

@interface YFAutolayoutTagViewController ()
@property (strong, nonatomic) SKTagView *tagView;
@property (strong, nonatomic) NSArray *colors;
@property (weak, nonatomic) IBOutlet UITextField *index;
@end

@implementation YFAutolayoutTagViewController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colors = @[@"#7ecef4", @"#84ccc9", @"#88abda", @"#7dc1dd", @"#b6b8de"];
    [self setupTagView];
}

#pragma mark - Private
- (void)setupTagView {
    self.tagView = ({
        SKTagView *view = [SKTagView new];
        view.backgroundColor = [UIColor whiteColor];
        view.padding = UIEdgeInsetsMake(12, 12, 12, 12);
        view.interitemSpacing = 15;
        view.lineSpacing = 10;
        __weak SKTagView *weakView = view;
        view.didTapTagAtIndex = ^(NSUInteger index){
            [weakView removeTagAtIndex:index];
        };
        view;
    });
    [self.view addSubview:self.tagView];
    [self.tagView mas_makeConstraints: ^(MASConstraintMaker *make) {
        UIView *superView = self.view;
        make.centerY.equalTo(superView.mas_centerY).with.offset(0);
        make.leading.equalTo(superView.mas_leading).with.offset(0);
        make.trailing.equalTo(superView.mas_trailing);
    }];
    
    //Add Tags , @"Python", @"Swift", @"Go", @"Objective-C", @"C", @"PHP"
    [@[@"Python", @"Javascript"] enumerateObjectsUsingBlock: ^(NSString *text, NSUInteger idx, BOOL *stop) {
        SKTag *tag = [SKTag tagWithText: text];
        tag.textColor = [UIColor whiteColor];
        tag.fontSize = 15;
        //tag.font = [UIFont fontWithName:@"Courier" size:15];
        //tag.enable = NO;
        tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
        tag.bgColor = [UIColor colorWithHexString:self.colors[idx % self.colors.count]];
        tag.cornerRadius = 5;
        [self.tagView addTag:tag];
    }];
}

#pragma mark - IBActions
- (IBAction)onAdd: (id)sender {
    SKTag *tag = [SKTag tagWithText: @"Some Language"];
    tag.textColor = [UIColor whiteColor];
    tag.fontSize = 15;
    tag.enable = YES;
    tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
    tag.bgColor = [UIColor colorWithHexString:self.colors[arc4random() % self.colors.count]];

    tag.cornerRadius = 5;
    
    [self.tagView addTag:tag];
}

- (IBAction)onInsert: (id)sender {
    SKTag *tag = [SKTag tagWithText: [NSString stringWithFormat:@"Insert(%ld)",(long)self.index.text.integerValue]];
    tag.textColor = [UIColor whiteColor];
    tag.fontSize = 15;
    tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
    tag.bgColor = [UIColor colorWithHexString:self.colors[arc4random() % self.colors.count]];;
    tag.cornerRadius = 5;
    
    [self.tagView insertTag: tag atIndex: self.index.text.integerValue];
}

- (IBAction)onRemove: (id)sender {
    [self.tagView removeTagAtIndex: self.index.text.integerValue];
}

- (IBAction)onTapBg: (id)sender {
    [self.view endEditing: YES];
}
@end

