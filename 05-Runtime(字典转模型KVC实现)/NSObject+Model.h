//
//  NSObject+Model.h
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/11/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

// 字典转模型
+ (instancetype)objectWithDict:(NSDictionary *)dict;

@end
