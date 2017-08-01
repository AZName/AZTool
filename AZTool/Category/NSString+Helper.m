//
//  NSString+Helper.m
//  Tool
//
//  Created by liguzhun on 16/8/22.
//  Copyright © 2016年 XuZhen. All rights reserved.
//

#import "NSString+Helper.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Helper)

#pragma 正则匹配邮箱号
- (BOOL)checkMailInput{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

#pragma 正则匹配手机号
- (BOOL)checkTelNumber
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,183,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[356])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
        // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
        {
        return YES;
        }
    else
        {
        return NO;
        }
    
}


#pragma 正则匹配用户密码6-18位数字和字母组合
- (BOOL)checkPassword
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{8,16}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
    
}

#pragma 正则匹配用户姓名,20位的中文或英文
- (BOOL)checkUserName
{
    NSString *pattern = @"^([\u4e00-\u9fa5]+|([a-zA-Z]+s?)+)$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}


#pragma 正则匹配用户身份证号15或18位
- (BOOL)checkUserIdCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

#pragma 正则匹员工号,12位的数字
- (BOOL)checkEmployeeNumber{
    NSString *pattern = @"^[0-9]{12}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
    
}

#pragma 正则匹配URL
- (BOOL)checkURL
{
    NSString *pattern = @"((http|ftp|https)://)(([a-zA-Z0-9._-]+.[a-zA-Z]{2,6})|([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9&%_./-~-]*)?";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

#pragma 正则匹配昵称
- (BOOL) checkNickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

#pragma 正则匹配以C开头的18位字符
- (BOOL) checkCtooNumberTo18
{
    NSString *nickNum=@"^C{1}[0-9]{18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nickNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma 正则匹配以C开头字符
- (BOOL) checkCtooNumber
{
    NSString *nickNum=@"^C{1}[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nickNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma 正则匹配银行卡号是否正确
- (BOOL) checkBankNumber{
    NSString *bankNum=@"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma 正则匹配17位车架号
- (BOOL) checkCheJiaNumber{
    NSString *bankNum=@"^(\\d{17})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma 正则只能输入数字和字母
- (BOOL) checkTeshuZifuNumber{
    NSString *bankNum=@"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma 车牌号验证
- (BOOL) checkCarNumber{
    NSString *bankNum = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}


#pragma mark 是否空字符串
- (BOOL)isEmptyString {
    if (![self isKindOfClass:[NSString class]]) {
        return TRUE;
    }else if (self==nil) {
        return TRUE;
    }else if(!self) {
            // null object
        return TRUE;
    } else if(self==NULL) {
            // null object
        return TRUE;
    } else if([self isEqualToString:@"NULL"]) {
            // null object
        return TRUE;
    }else if([self isEqualToString:@"(null)"]){
        
        return TRUE;
    }else{
            //  使用whitespaceAndNewlineCharacterSet删除周围的空白字符串
            //  然后在判断首位字符串是否为空
        NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
                // empty string
            return TRUE;
        } else {
                // is neither empty nor null
            return FALSE;
        }
    }
}
#pragma mark 清空字符串中的空白字符
- (NSString *)trimString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark 返回沙盒中的文件路径
+ (NSString *)stringWithDocumentsPath:(NSString *)path {
    NSString *file = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [file stringByAppendingPathComponent:path];
}

#pragma mark 写入系统偏好
- (void)saveToNSDefaultsWithKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:self forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark 一串字符在固定宽度下，正常显示所需要的高度 method
+ (CGFloat)autoHeightWithString:(NSString *)string Width:(CGFloat)width Font:(UIFont *)font {
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 10;//行间距
    paragraph.paragraphSpacing = 50;//段落间隔
    paragraph.firstLineHeadIndent = 50;//首行缩近
                                       //绘制属性（字典）
    NSDictionary * dictA = @{NSFontAttributeName:[UIFont systemFontOfSize:20],
                             NSForegroundColorAttributeName:[UIColor greenColor],
                             NSBackgroundColorAttributeName:[UIColor grayColor],
                             NSParagraphStyleAttributeName:paragraph,
                             //                             NSObliquenessAttributeName:@0.5 //斜体
                             //                             NSStrokeColorAttributeName:[UIColor whiteColor],
                             //                             NSStrokeWidthAttributeName:@2,//描边
                             //                             NSKernAttributeName:@20,//字间距
                             //                             NSStrikethroughStyleAttributeName:@2//删除线
                             //                             NSUnderlineStyleAttributeName:@1,//下划线
                             };
    
        //大小
    CGSize boundRectSize = CGSizeMake(width, MAXFLOAT);
    
        //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:dictA context:nil].size.height;
    return newFloat;
}

#pragma mark 一串字符在一行中正常显示所需要的宽度 method
+ (CGFloat)autoWidthWithString:(NSString *)string Font:(UIFont *)font {
    
        //大小
    CGSize boundRectSize = CGSizeMake(MAXFLOAT, font.lineHeight);
        //绘制属性（字典）
    NSDictionary *fontDict = @{ NSFontAttributeName: font };
        //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:fontDict context:nil].size.width;
    return newFloat;
}

+ (NSAttributedString *)makeDeleteLine:(NSString *)string{
    string = [NSString stringWithFormat:@"<html><body style =\"font-size:12px;\"><s><font color=\"#B6B6B6\">%@</font></s></body></html>",string];
    NSAttributedString * attributeString = [[NSAttributedString alloc]initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    return attributeString;
}

/**
 *不同颜色字体富文本
 */
- (NSAttributedString *)otherOfColor:(UIColor*)color length:(NSInteger)length {
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:self];
    [att addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(length, self.length - length)];
    return att;
}

- (id)MD5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}


- (NSString *)partStringHidden{
    if (self.length == 0) {
        return @"";
    }
    NSMutableString *endStr;
    NSString *hiddenStr;
    NSRange range;
    if (self.length <=3 ) {
        range = NSMakeRange(1, self.length-1);
    }else {
        range = NSMakeRange(3, self.length -3);
    }
    hiddenStr = [self substringWithRange:range];
    NSMutableString *showStr = [[NSMutableString alloc]init];
    for (int i = 0; i <hiddenStr.length; i ++) {
        [showStr appendString:@"*"];
    }
    endStr = [NSMutableString stringWithString:self];
    [endStr replaceCharactersInRange:range withString:showStr];    
    
    return endStr;
}

- (NSString *)partStringHiddenWith:(NSRange)range {
    NSMutableString *showStr = [[NSMutableString alloc]init];
    for (int i = 0; i <range.length; i ++) {
        [showStr appendString:@"*"];
    }
    return [self stringByReplacingCharactersInRange:range withString:showStr];
}


@end
