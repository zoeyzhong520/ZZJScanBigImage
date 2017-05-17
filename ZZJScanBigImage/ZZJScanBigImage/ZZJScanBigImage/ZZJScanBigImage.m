//
//  ZZJScanBigImage.m
//  ZZJScanBigImage
//
//  Created by JOE on 2017/5/17.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import "ZZJScanBigImage.h"

@implementation ZZJScanBigImage

//原始尺寸
static CGRect oldFrame;

//浏览大图
+ (void)scanBigImageWithImageView:(UIImageView *)currentImageView {
    //当前imageview的图片
    UIImage *image = currentImageView.image;
    //当前视图
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //背景view
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    //当前imageview的原始尺寸->将像素currentImageview.bounds由currentImageview.bounds所在视图转换到目标视图window中，返回在目标视图window中的像素值
    oldFrame = [currentImageView convertRect:currentImageView.bounds toView:window];
    [backgroundView setBackgroundColor:[UIColor blackColor]];//设置背景色
    //此时视图不会显示
    [backgroundView setAlpha:0];
    //将所展示的imageView重新绘制在Window中
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:oldFrame];
    [imageView setImage:image];
    [imageView setTag:0];//设置tag值
    [backgroundView addSubview:imageView];
    //将原始视图添加到背景视图中
    [window addSubview:backgroundView];
    
    //添加点击事件同样是类方法 -> 作用是再次点击回到初始大小
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideImageView:)];
    [backgroundView addGestureRecognizer:tap];
    
    //动画放大所展示的ImageView
    [UIView animateWithDuration:0.4 animations:^{
        CGFloat y,width,height;
        y = (screenHeight - image.size.height * screenWidth / image.size.width) * 0.5;
        //宽度为屏幕宽度
        width = screenWidth;
        //高度 根据图片宽高比设置
        height = image.size.height * screenWidth / image.size.width;
        [imageView setFrame:CGRectMake(0, y, width, height)];
        //将视图显示出来
        [backgroundView setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
}

//tap 点击事件
+ (void)hideImageView:(UITapGestureRecognizer *)tap {
    UIView *backgroungView = tap.view;
    //原始imageview
    UIImageView *imageView = [tap.view viewWithTag:0];
    //恢复
    [UIView animateWithDuration:0.4 animations:^{
        [imageView setFrame:oldFrame];
        [backgroungView setAlpha:0];
    } completion:^(BOOL finished) {
        //将背景视图删掉
        [backgroungView removeFromSuperview];
    }];
}

@end
