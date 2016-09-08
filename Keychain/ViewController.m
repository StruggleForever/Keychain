//
//  ViewController.m
//  Keychain
//
//  Created by 颜镜圳 on 16/9/7.
//  Copyright © 2016年 颜镜圳. All rights reserved.
//

#import "ViewController.h"
#import "LRKeychain.h"

static NSString *key = @"Mr.Yan";
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *topTextField;
@property (weak, nonatomic) IBOutlet UITextField *bottomTextField;

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

- (IBAction)addMessage:(UIButton *)sender {
    if ([LRKeychain getKeychainDataForKey:key]) {
        NSLog(@"该key内已有数据,为:%@",[LRKeychain getKeychainDataForKey:key]);
        [LRKeychain addKeychainData:self.topTextField.text forKey:key];
        NSLog(@"该key内容被修改为:%@",[LRKeychain getKeychainDataForKey:key]);
        
    }else{
        NSLog(@"该key不存在，写入内容");
        [LRKeychain addKeychainData:self.topTextField.text forKey:key];
        NSLog(@"已写入，该key内容:%@",[LRKeychain getKeychainDataForKey:key]);
    }
}

- (IBAction)GetMessage:(UIButton *)sender {
    self.bottomTextField.text = [LRKeychain getKeychainDataForKey:key];
}

- (IBAction)DeleteMessage:(UIButton *)sender {
    [LRKeychain deleteKeychainDataForKey:key];
}

@end
