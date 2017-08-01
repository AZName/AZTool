//
//  UIViewController+Aleart.h
//  EasyProcurement
//
//  Created by liguzhun on 16/7/6.
//  Copyright © 2016年 XuZhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Aleart)
/**
 *  有两个按钮的提示框
 *
 *  @param title       提示框的标题
 *  @param message     提示内容
 *  @param cancelTitle       取消按钮标题
 *  @param okComplection 取消点击回调
 *  @param okTitle       确认按钮标题
 *    确认点击回调
 */
- (void)showAleartViewWithTitle:(NSString*)title message:(NSString *)message actionWithCancelTitle:(NSString*)cancelTitle cancelCompletion:(void(^)(void))cancelComplection actionWithOKTitle:(NSString*)okTitle okCompletion:(void(^)(void))okComplection;


- (void)showActionSheetViewWithTitle:(NSString *)title
                             message:(NSString *)message
               actionWithCancelTitle:(NSString*)cancelTitle
                    cancelCompletion:(void(^)(void))cancelComplection actionWithOtherTitle:(NSArray<NSString *> *)otherTitle therCompletion:(void(^)(NSInteger index))therComplection;


/**
 提示一秒后自动消失

 @param promptStr  提示文字
 */
- (void)showWithPrompt:(NSString *)promptStr;

/**
 显示等待菊花

 @param promptStr 菊花下面的文字
 */
- (void)showActivityWithPrompt:(NSString *)promptStr;

/**
 显示进度条提示

 @param promptStr 进度条文字
 @param progress 进度0-1
 */
- (void)showDeterminateWithPrompt:(NSString *)promptStr progress:(float)progress;

/**
 显示 gif 提示

 @param string  提示文字
 */
- (void)setGifWithMBProgress:(NSString *)string;

/**
 隐藏提示框
 */
- (void)hiddenHUD;


@end
