//
//  ViewController.m
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/11/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

#import "Status.h"

#import "NSDictionary+PropertyCode.h"

#import "NSObject+Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 获取文件全路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    
    NSDictionary *statusDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    // 生成用户模型属性代码
//    [statusDict[@"user"] propertyCode];
    
    // 获取用户字典
    
    
    // 字典转模型
    Status *status = [Status objectWithDict:statusDict];
    
    NSLog(@"%@",status.user);
    
//    Status *s = [Status statusWithDict:dict];
    
//    NSLog(@"%@",dict);
    
}


@end
