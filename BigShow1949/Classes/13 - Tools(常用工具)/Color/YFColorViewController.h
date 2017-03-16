//
//  YFColorViewController.h
//  BigShow1949
//
//  Created by zhht01 on 16/3/31.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFColorViewController : UIViewController

// rgb
@property (weak, nonatomic) IBOutlet UITextField *r;
@property (weak, nonatomic) IBOutlet UITextField *g;

@property (weak, nonatomic) IBOutlet UITextField *b;

- (IBAction)rgbToHexBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *rgbToHexLabel;

@property (weak, nonatomic) IBOutlet UIView *rgbToHexView;


// hex

@property (weak, nonatomic) IBOutlet UITextField *hexField;
@property (weak, nonatomic) IBOutlet UILabel *hexToRgbLabel;

- (IBAction)hexToRgbBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *hexToRgbView;


@end
