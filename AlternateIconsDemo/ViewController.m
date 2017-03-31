//
//  ViewController.m
//  AlternateIconsDemo
//
//  Created by 于宙 on 2017/3/30.
//  Copyright © 2017年 ryan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickIcon:(id)sender {
    [self setIconName:nil];//nil表示换回原始Icon
}

- (IBAction)clickIcon1:(id)sender {
    [self setIconName:@"Icon1"];
}

- (IBAction)clickIcon2:(id)sender {
    [self setIconName:@"Icon2"];
}

- (void)setIconName:(NSString *)name {
    UIApplication *application = [UIApplication sharedApplication];
    
    //先判断设备支不支持“AlternateIcons”
    if ([application supportsAlternateIcons]) {
        
        //这里的IconName必须在Info.plist里定义，具体格式看Info.plist
        [application setAlternateIconName:name completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"error => %@", error.localizedDescription);
            } else {
                NSLog(@"done!");
            }
        }];
    }
}

@end
