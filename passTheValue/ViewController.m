//
//  ViewController.m
//  passTheValue
//
//  Created by 叶子 on 2018/3/11.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "valueShare.h"

@interface ViewController ()<SecondVCDelegate>

@property (weak, nonatomic) IBOutlet UILabel *recevieLab;

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([valueShare sharedInstance].valueStr == nil) {
//        self.recevieLab.text = @"接受传来的值";
    }
    self.recevieLab.text = [valueShare sharedInstance].valueStr ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)pushNextVC:(id)sender {
    
    UIButton * btn = (UIButton*)sender;
    SecondViewController * vc = [[SecondViewController alloc]init];
    vc.myTag = btn.tag;
    switch (btn.tag) {
        case 100:
        {
            vc.delegate = self;
        }
            break;
        case 101:
        {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getStr:) name:@"value" object:nil];

        }
            break;
        case 102:
        {
#pragma mark - 监听的是属性
            [vc addObserver:self forKeyPath:@"tf.text" options:NSKeyValueObservingOptionNew context:nil];
        }
            break;
        case 103:
        {
            NSLog(@"单例传值");
           


        }
            break;
        case 104:
        {
#pragma mark - 拿到block的值
            vc.valueBlock = ^(NSString *value) {
                self.recevieLab.text = value;
            };

        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)getValueStr:(NSString *)str
{
    self.recevieLab.text = str;
}
-(void)getStr:(NSNotification*)noti
{
    NSString * str = noti.userInfo[@"value"];
    self.recevieLab.text = str;
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"keyPath=%@,object=%@,change=%@,context=%@",keyPath,object,change,context);

    if ([keyPath isEqualToString:@"tf.text"]) {
        NSString * str = [change objectForKey:@"new"];
        self.recevieLab.text = str;
    }
   
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"value" object:nil];
    [self removeObserver:self forKeyPath:@"value"];
//    [super dealloc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
