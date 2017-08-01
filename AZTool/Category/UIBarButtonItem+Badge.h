//
//  UIBarButtonItem+Badge.h
//  ECAIH
//
//  Created by liguzhun on 2017/1/13.
//  Copyright © 2017年 XuZhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Badge)

@property (strong, nonatomic) UILabel *badge;

    // Badge value to be display
@property (nonatomic) NSString *badgeValue;
    // Badge background color
@property (nonatomic) UIColor *badgeBGColor;
    // Badge text color
@property (nonatomic) UIColor *badgeTextColor;
    // Badge font
@property (nonatomic) UIFont *badgeFont;
    // Padding value for the badge
@property (nonatomic) CGFloat badgePadding;
    // Minimum size badge to small
@property (nonatomic) CGFloat badgeMinSize;
    // Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat badgeOriginX;
@property (nonatomic) CGFloat badgeOriginY;
    // In case of numbers, remove the badge when reaching zero
@property BOOL shouldHideBadgeAtZero;
    // Badge has a bounce animation when value changes
@property BOOL shouldAnimateBadge;

@end

