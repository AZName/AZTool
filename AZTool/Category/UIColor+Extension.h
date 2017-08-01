//
//  UIColor+Extension.h
//  Tool
//
//  Created by liguzhun on 16/8/22.
//  Copyright © 2016年 XuZhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
