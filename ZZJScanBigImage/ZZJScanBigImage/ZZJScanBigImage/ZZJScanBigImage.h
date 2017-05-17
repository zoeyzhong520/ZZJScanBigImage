//
//  ZZJScanBigImage.h
//  ZZJScanBigImage
//
//  Created by JOE on 2017/5/17.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface ZZJScanBigImage : NSObject

+ (void)scanBigImageWithImageView:(UIImageView *)currentImageView;

@end
