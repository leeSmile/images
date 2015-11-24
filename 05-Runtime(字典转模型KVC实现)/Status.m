//
//  Status.m
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/11/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "Status.h"

@implementation Status

/*
    模型的属性名根字典key不一一对应
 
 */

+ (Status *)statusWithDict:(NSDictionary *)dict
{
    // 创建对象
    Status *s = [[self alloc] init];
    
    // KVC
    [s setValuesForKeysWithDictionary:dict];
    
    return s;
    
}
// 思想:系统莫名其妙的效果不想要,重写,干掉

// 重写方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
//    [super setValue:value forUndefinedKey:key];
}

@end
