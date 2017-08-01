//
//  NSObject+UserInfo.h
//  Tool
//
//  Created by liguzhun on 16/8/22.
//  Copyright © 2016年 XuZhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UserInfo)


/**
 *  设备名称(型号)
 *
 *  @return <#return value description#>
 */
- (NSString *)getDeviceName;
/**
 *  获取用户设备名称
 *
 *  @return <#return value description#>
 */
- (NSString *)getEquipmentName;
/**
 *  获取当前 APP 版本号
 *
 *  @return <#return value description#>
 */
- (NSString *)getAppVerion;

/**
 *  获取电池电量
 *
 *  @return <#return value description#>
 */
- (float)getBatteryLevel;
/**
 *  本地设备模式
 *
 *  @return <#return value description#>
 */
- (NSString *)getLocalizedModel;

/**
 *  获取当前系统名称;
 *
 *  @return <#return value description#>
 */
- (NSString *)getSystemName;
/**
 *  获取当前系统版本号
 *
 *  @return <#return value description#>
 */
- (NSString *)getSystemVersion;
/**
 *  获取广告标识符
 *
 *  @return <#return value description#>
 */
- (NSString *)getIDFA;
/**
 *  获取设备唯一标示
 *
 *  @return <#return value description#>
 */
- (NSString *)getUUID;
/**
 *  获取设备模型
 *
 *  @return <#return value description#>
 */
- (NSString *)getDevice_model;


    // 获取ip
- (NSString *)getDeviceIPAddresses;


/**
 *  获取mac地址
 *
 *  @return mac地址  为了保护用户隐私，每次都不一样，苹果官方哄小孩玩的
 */
- (NSString *)getMacAddress;

@end
