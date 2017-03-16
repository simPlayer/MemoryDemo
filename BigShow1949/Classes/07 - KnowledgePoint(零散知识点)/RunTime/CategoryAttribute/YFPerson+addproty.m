//
//  YFPerson+addproty.m
//  BigShow1949
//
//  Created by zhht01 on 16/4/14.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFPerson+addproty.h"
#import <objc/runtime.h>


@implementation YFPerson (addproty)


static char const *strAddrKey = "strAddrKey";
- (NSString *)addr
{
    // 根据关联的key,获取关联的zhi
    return objc_getAssociatedObject(self, strAddrKey);
}
- (void)setAddr:(NSString *)addr
{
    /*
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     四个参数:
     1) id object 给哪个对象的属性赋值
     2) const void *key 属性对应的key
     3) id value  设置属性值为value
     4) objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     */
    objc_setAssociatedObject(self, strAddrKey, addr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)saySex{
    NSLog(@"%s----%@",__func__,self);
}
/*
 在分类中@property不会生成_变量，也不会实现getter和setter方法,我们可以手动实现如下
 
 -(NSString *)addr{
 return @"addr";
 }
 -(void)setAddr:(NSString *)addr{
 
 }
 但是这样是没什么意义的，而且分类中不允许定义变量，所以只能用runtime类实现
 */
@end
