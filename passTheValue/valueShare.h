//
//  valueShare.h
//  passTheValue
//
//  Created by 叶子 on 2018/3/11.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface valueShare : NSObject
+(instancetype)sharedInstance;
@property(nonatomic,strong)NSString * valueStr;
@end
