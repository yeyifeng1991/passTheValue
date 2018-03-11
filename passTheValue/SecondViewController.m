//
//  SecondViewController.m
//  passTheValue
//
//  Created by 叶子 on 2018/3/11.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import "SecondViewController.h"
#import "valueShare.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
}


- (IBAction)goBack:(id)sender {
    if (self.tf.text ==nil &&self.tf.text.length==0) {
        return;
    }
    
    switch (self.myTag) {
        case 100:
        {
            if ([self.delegate respondsToSelector:@selector(getValueStr:)]) {
                if (self.tf.text.length) {
                    [self.delegate getValueStr:self.tf.text];
                }
            }
        }
            break;
        case 101:
        {
            NSLog(@"通知传值");
            NSString * str = self.tf.text;
            [[NSNotificationCenter defaultCenter]postNotificationName:@"value" object:nil userInfo:@{@"value":str}];
            
        }
            break;
        case 102:
        {
  
            
        }
            break;
        case 103:
        {
            // 保存的上次的值
            
            [valueShare sharedInstance].valueStr = self.tf.text;
            
        }
            break;
        case 104:
        {
            NSLog(@"block传值");
            NSString * valueStr = self.tf.text;
#pragma mark - 通过block传递值，为防止崩溃，判断block是否实现
            __weak typeof (self)weakSelf = self;
            if (weakSelf.valueBlock) {
                weakSelf.valueBlock(valueStr);
            }
            
        }
            break;
            
        default:
            break;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
