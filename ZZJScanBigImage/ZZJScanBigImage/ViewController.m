//
//  ViewController.m
//  ZZJScanBigImage
//
//  Created by JOE on 2017/5/17.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import "ViewController.h"
#import "ZZJScanBigImage.h"

@interface ViewController ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) ZZJScanBigImage *zzjScanBigImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 300, 200)];
    _imageView.image = [UIImage imageNamed:@"one-piece.jpeg"];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    
    //添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scanBigImageWithTap:)];
    [_imageView addGestureRecognizer:tap];
}

- (void)scanBigImageWithTap:(UITapGestureRecognizer *)tap {
    UIImageView *imageView = (UIImageView *)tap.view;
    [ZZJScanBigImage scanBigImageWithImageView:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
