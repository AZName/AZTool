    //
    //  UIViewController+Aleart.m
    //  EasyProcurement
    //
    //  Created by liguzhun on 16/7/6.
    //  Copyright © 2016年 XuZhen. All rights reserved.
    //

#import "UIViewController+Aleart.h"
#import "MBProgressHUD.h"
#import "UIImage+GIF.h"
static MBProgressHUD *hud;

@implementation UIViewController (Aleart)

- (void)showAleartViewWithTitle:(NSString*)title message:(NSString *)message actionWithCancelTitle:(NSString*)cancelTitle cancelCompletion:(void(^)(void))cancelComplection actionWithOKTitle:(NSString*)okTitle okCompletion:(void(^)(void))okComplection; {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelComplection();
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        okComplection();
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}


- (void)showActionSheetViewWithTitle:(NSString *)title
                             message:(NSString *)message
               actionWithCancelTitle:(NSString*)cancelTitle
                    cancelCompletion:(void(^)(void))cancelComplection actionWithOtherTitle:(NSArray<NSString *> *)otherTitle therCompletion:(void(^)(NSInteger index))therComplection {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelComplection();
    }]];
    [otherTitle enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [alert addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            therComplection(idx);
        }]];
        
    }];
    [self presentViewController:alert animated:YES completion:nil];

}

//显示文字2秒后消失
- (void)showWithPrompt:(NSString *)promptStr {
    //只显示文字
    if (hud !=nil) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [hud removeFromSuperview];
    }
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = promptStr;
    hud.label.numberOfLines = 0;
    hud.margin = 15;
    hud.offset = CGPointMake(0, -50);
    [hud hideAnimated:YES afterDelay:2];
}
//选择视图显示等待动画 及提示文字
- (void)showActivityWithPrompt:(NSString *)promptStr {
    if (hud !=nil) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [hud removeFromSuperview];
        
    }
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = promptStr;
    hud.margin = 15;
    hud.offset = CGPointMake(0, -50);
}
//选择视图显示等待动画
- (void)showDeterminateWithPrompt:(NSString *)promptStr progress:(float)progress {
    if ([MBProgressHUD HUDForView:self.view]) {
        hud.progress =progress;
        hud.label.text = promptStr;
    }else{
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        hud.userInteractionEnabled = NO;
        hud.label.text = promptStr;
        hud.label.numberOfLines = 0;
        hud.progress = 0;
        hud.margin = 15;
        hud.offset = CGPointMake(0, -50);
    }
}

- (void)setGifWithMBProgress:(NSString *)string {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [hud removeFromSuperview];
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    hud.userInteractionEnabled = NO;
    /*!
     *  @author WS, 15-11-26 15:11:52
     *
     *  是否显示遮罩
     */
    [self.view addSubview:hud];
    
    hud.label.text = string;
    /*!
     *  @author WS, 15-11-26 15:11:05
     *
     *  字体颜色
     */
    hud.offset = CGPointMake(0, -50);
    
    hud.label.textColor=[UIColor blackColor];
    
    hud.mode = MBProgressHUDModeCustomView;
    
    /*!
     *  @author WS, 15-11-26 15:11:32
     *
     *  如果修改动画图片就在这里修改
     */
    UIImage *images=[UIImage sd_animatedGIFNamed:@"pika2"];
    
    hud.customView = [[UIImageView alloc] initWithImage:images];
    [hud showAnimated:YES];
    
}
//隐藏等待动画
- (void)hiddenHUD {
    
    [MBProgressHUD hideHUDForView:self.view  animated:YES];
    [hud removeFromSuperview];
}


@end
