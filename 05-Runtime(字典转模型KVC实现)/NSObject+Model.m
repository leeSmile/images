//
//  NSObject+Model.m
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/11/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "NSObject+Model.h"

#import <objc/message.h>

@implementation NSObject (Model)
// KVC:遍历字典中所有key,去模型中查找
// runtime:遍历模型中的所有属性,去字典中查找对应的value给属性赋值

+ (instancetype)objectWithDict:(NSDictionary *)dict
{
    id objc = [[self alloc] init];
    
    // 给模型的属性赋值
    
    // 1.获取模型中属性名,source
    // 2.value = dict[source]
    // 3.给模型的属性赋值 KVC [objc setValue:value forKey:@"source"]
    
    // 解决:如何获取当前类的所有成员变量
    // class_copyIvarList:获取某个类中成员属性列表(数组)
    // class:获取哪个类的成员属性
    // count:成员属性的总数
    int count = 0;
    
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    // 遍历模型中所有属性,给属性赋值
    for (int i = 0; i < count; i++) {
        // user
        
        // 获取成员属性
        Ivar ivar = ivarList[i];
        
        // 1.获取成员属性名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 获取属性类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        

        
        // 1.1 获取字典的key user
        NSString *key = [ivarName substringFromIndex:1];

        
        // 2.从字典获取value
        id value = dict[key];
        
        // 2.1 二级转换,判断下当前有没有字典,只有字典才需要转模型
        
        // 属性值是字典,属性类型不是系统的类型,才需要转换
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType containsString:@"NS"]) {
            // user
            NSLog(@"%@ %@ %@",key,value,ivarType);
            // 成员属性类型有问题
            // 处理类型
           ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
            // @"@User"
            // \" = "
            // 获取类 @"User"
            Class modelClass = NSClassFromString(ivarType);
            
            
            // 创建模型对象
            value = [modelClass objectWithDict:value];
            
            
        }
        
        // 3.给模型的属性赋值
        [objc setValue:value forKey:key];
        
    }
   
    
    return objc;
}
/*
 int a[] = {1,2,3};
 int *p = &a;
 NSLog(@"%d",p[0]);
 */
@end
