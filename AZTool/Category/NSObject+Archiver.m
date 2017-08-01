//
//  NSObject+Archiver.m
//  LOVEGIRLFRIEND
//
//  Created by liguzhun on 2016/11/28.
//  Copyright © 2016年 XuZhen. All rights reserved.
//

#import "NSObject+Archiver.h"

@implementation NSObject (Archiver)



+ (void)archiverwith:(id)object modelFileName:(Class)fileName {
    __weak NSString *path = [NSString stringWithFormat:@"/%@/%@.data",[self filePathModelCache],NSStringFromClass(fileName)];
    /*
     *没有实现MJCodingImplementation 这个宏定义的时候一般断点会定位到这里
     *MJCodingImplementation 这个为MJExtension NSCopying 协议宏
     */
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        BOOL isArch = [NSKeyedArchiver archiveRootObject:object toFile:path];
        if (!isArch) {
            NSLog(@"归档失败----%@",NSStringFromClass(fileName));
        }
  
    });
}

+ (id)unArchiverWithModelFileName:(Class)fileName {
    NSString *path = [NSString stringWithFormat:@"/%@/%@.data",[self filePathModelCache],NSStringFromClass(fileName)];
    id object = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!object) {
        NSLog(@"读取失败---%@",NSStringFromClass(fileName));
        return nil;
    }else{
        return object;
    }
    
}

+ (NSString *)filePathModelCache {
    NSFileManager *manage = [NSFileManager defaultManager];
    NSString *path  = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ModelCache"];
    if (![manage fileExistsAtPath:path]) {
        [manage createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        return path;

    }else{
        return path;
    }
}

+ (void)removeModelFileName:(Class)fileName {
    NSFileManager *manage = [NSFileManager defaultManager];
    NSString *path = [NSString stringWithFormat:@"/%@/%@.data",[self filePathModelCache],NSStringFromClass(fileName)];
    NSError *error;
    if (![manage removeItemAtPath:path error:&error]) {
        NSLog(@"文件删除失败--%@",error);
    }
}
    //
+ (void)clearCacheAllModel {
    NSFileManager *manage = [NSFileManager defaultManager];
    NSError *error;
    if (![manage removeItemAtPath:[self filePathModelCache] error:&error]) {
        NSLog(@"文件删除失败--%@",error);
    }
}

+ (long long)allCacheModelSize {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    long long folderSize = 0;
    
    if ([fileManager fileExistsAtPath:[self filePathModelCache]])
        {
        NSArray *childerFiles = [fileManager subpathsAtPath:[self filePathModelCache]];
        for (NSString *fileName in childerFiles)
            {
            NSString *fileAbsolutePath = [[self filePathModelCache] stringByAppendingPathComponent:fileName];
            if ([fileManager fileExistsAtPath:fileAbsolutePath])
                {
                long long size = [fileManager attributesOfItemAtPath:fileAbsolutePath error:nil].fileSize;
                folderSize += size;
                }
            }
        }
    
    return folderSize;
}

@end
