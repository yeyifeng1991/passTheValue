//
//  SecondViewController.h
//  passTheValue
//
//  Created by 叶子 on 2018/3/11.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^valueBlock)(NSString * value);
@protocol SecondVCDelegate<NSObject>
-(void)getValueStr:(NSString*)str;
@end
@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property(nonatomic,assign)id<SecondVCDelegate>delegate;
@property(nonatomic,assign)NSInteger myTag;
@property(nonatomic,copy)valueBlock valueBlock;
@end
