//
//  User.h
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/11/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic ,strong) NSString *profile_image_url;

@property (nonatomic ,assign) BOOL vip;

@property (nonatomic ,strong) NSString *name;

@property (nonatomic ,assign) NSInteger mbrank;

@property (nonatomic ,assign) NSInteger mbtype;

@end
