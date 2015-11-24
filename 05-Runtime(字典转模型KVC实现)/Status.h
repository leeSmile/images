//
//  Status.h
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/11/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

// 自动生成模型的属性代码

// 根据字典生成属性代码

@class User;

@interface Status : NSObject

//@property (nonatomic ,assign) BOOL aaa;

@property (nonatomic ,strong) NSString *source;

@property (nonatomic ,assign) NSInteger reposts_count;

@property (nonatomic ,strong) NSArray *pic_urls;

@property (nonatomic ,strong) NSString *created_at;

@property (nonatomic ,assign) NSInteger attitudes_count;

@property (nonatomic ,strong) NSString *idstr;

@property (nonatomic ,strong) NSString *text;

@property (nonatomic ,assign) NSInteger comments_count;

@property (nonatomic ,strong) User *user;


+ (__kindof Status *)statusWithDict:(NSDictionary *)dict;

@end
