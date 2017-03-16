//
//  UILabel+Associate.m
//  BigShow1949
//
//  Created by zhht01 on 16/4/15.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "UILabel+Associate.h"

@implementation UILabel (Associate)

static char flashColorKey;
- (void)setFlashColor:(UIColor *)flashColor {
    self.backgroundColor = flashColor;
    objc_setAssociatedObject(self, &flashColorKey, flashColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    objc_setAssociatedObject(<#id object#>, <#const void *key#>, <#id value#>, <#objc_AssociationPolicy policy#>)
}
- (UIColor *)flashColor {
    return objc_getAssociatedObject(self, &flashColorKey);
//    objc_getAssociatedObject(<#id object#>, <#const void *key#>)
}


/*
 key：我们注意到在函数签名中key的类型const void *，这表示key仅仅是一个地址，而不是字符串的内容，这也是为什么flashColorKey没有初始化的原因，因为具体指向什么内容我们无所谓，我们要的仅仅是地址！如果在setAssocaitedObject中你传入的是flashColorKey，那get方法得到的值将会是nil。正确的应该是传入地址&flashColorKey。
 
 */














@end
