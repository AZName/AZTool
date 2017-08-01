//
//  NSObject+Archiver.h
//  LOVEGIRLFRIEND
//
//  Created by liguzhun on 2016/11/28.
//  Copyright © 2016年 XuZhen. All rights reserved.
//

#import <Foundation/Foundation.h>
    /*
     *
     *
     */
@interface NSObject (Archiver)
    //编码
+ (void)archiverwith:(id)object modelFileName:(Class)fileName;
    //解码
+ (id)unArchiverWithModelFileName:(Class)fileName;
    //删除单个 model 缓存
+ (void)removeModelFileName:(Class)fileName;
    //删除所有 model 缓存
+ (void)clearCacheAllModel;
    //所有 model 缓存大小
+ (long long)allCacheModelSize;

@end
