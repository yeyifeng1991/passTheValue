//
//  valueShare.m
//  passTheValue
//
//  Created by 叶子 on 2018/3/11.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import "valueShare.h"
static valueShare * _instance = nil;

@interface valueShare()
@end
@implementation valueShare
//因为alloc会执行allocWithZone,所以如果想只分配一次内存就要重写此方法,同时为了严谨,防止copy出现以上问题,还要重写copyWithZone``mutableCopyWithZone
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone ];
    });
    return _instance;
}

+(instancetype) sharedInstance{
    if (_instance == nil) {
        _instance = [[super alloc]init];
    }
    return _instance;
}

-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}


@end
