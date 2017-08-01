    //
    //  NSString+Helper.h
    //  Tool
    //
    //  Created by liguzhun on 16/8/22.
    //  Copyright © 2016年 XuZhen. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Helper)

#pragma 正则匹配邮箱号
- (BOOL)checkMailInput;
#pragma 正则匹配手机号
- (BOOL)checkTelNumber;
#pragma 正则匹配用户密码6-18位数字和字母组合
- (BOOL)checkPassword;
#pragma 正则匹配用户姓名,20位的中文或英文
- (BOOL)checkUserName;
#pragma 正则匹配用户身份证号
- (BOOL)checkUserIdCard;
#pragma 正则匹员工号,12位的数字
- (BOOL)checkEmployeeNumber;
#pragma 正则匹配URL
- (BOOL)checkURL;
#pragma 正则匹配昵称
- (BOOL) checkNickname;
#pragma 正则匹配以C开头的18位字符
- (BOOL) checkCtooNumberTo18;
#pragma 正则匹配以C开头字符
- (BOOL) checkCtooNumber;
#pragma 正则匹配银行卡号是否正确
- (BOOL) checkBankNumber;
#pragma 正则匹配17位车架号
- (BOOL) checkCheJiaNumber;
#pragma 正则只能输入数字和字母
- (BOOL) checkTeshuZifuNumber;
#pragma 车牌号验证
- (BOOL) checkCarNumber;


/**
 *  清空字符串中的空白字符
 *
 *  @return 清空空白字符串之后的字符串
 */
- (NSString *)trimString;

/**
 *  是否空字符串
 *
 *  @return 如果字符串为nil或者长度为0返回YES
 */
- (BOOL)isEmptyString;

/**
 *  返回沙盒中的文件路径
 *
 *  @return 返回当前字符串对应在沙盒中的完整文件路径
 */
+ (NSString *)stringWithDocumentsPath:(NSString *)path;

/**
 *  写入系统偏好
 *
 *   key 写入键值
 */
- (void)saveToNSDefaultsWithKey:(NSString *)key;

/**
 *  一串字符在固定宽度下，正常显示所需要的高度
 *
 *   string：文本内容
 *   width：每一行的宽度
 *   字体大小
 */
+ (CGFloat)autoHeightWithString:(NSString *)string
                          Width:(CGFloat)width
                           Font:(UIFont *)font;

/**
 *  一串字符在一行中正常显示所需要的宽度
 *
 *   string：文本内容
 *   字体大小
 */
+ (CGFloat)autoWidthWithString:(NSString *)string
                          Font:(UIFont *)font;
/**
 *下划线文字
 */

+ (NSAttributedString *)makeDeleteLine:(NSString *)string;

/**
 *不同颜色字体富文本
 */
- (NSAttributedString *)otherOfColor:(UIColor*)color length:(NSInteger)length;

/**
 *md5加密
 */
- (id)MD5;

- (NSString *)partStringHidden;

- (NSString *)partStringHiddenWith:(NSRange)range;


@end
