//
//  UIImage+Extension.h
//  Tool
//
//  Created by liguzhun on 16/8/22.
//  Copyright © 2016年 XuZhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

    // 生成一个圆形图片
+ (instancetype)circleImageNamed:(NSString *)name;

    // 给定一个不要渲染的图片名称,生成一个最原始的图片
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;

    // 模糊效果(渲染很耗时间,建议在子线程中渲染)
- (UIImage *)blurImage;
- (UIImage *)blurImageWithMask:(UIImage *)maskImage;
- (UIImage *)blurImageWithRadius:(CGFloat)radius;
- (UIImage *)blurImageAtFrame:(CGRect)frame;

    // 灰度效果
- (UIImage *)grayScale;

    // 固定宽度与固定高度
- (UIImage *)scaleWithFixedWidth:(CGFloat)width;
- (UIImage *)scaleWithFixedHeight:(CGFloat)height;

    // 平均的颜色
- (UIColor *)averageColor;

    // 裁剪图片的一部分
- (UIImage *)croppedImageAtFrame:(CGRect)frame;

    // 将自身填充到指定的size
- (UIImage *)fillClipSize:(CGSize)size;

    //指定的宽度缩放图片大小
- (UIImage *)imageCompressWidth:(CGFloat)defineWidth;
/**
 *  生成二维码图片
 *
 *  @param content 二维码内容
 *  @param size    生成图片大小
 *
 *  @return 返回生成图片
 */
+ (UIImage *)encodeQRImageWithContent:(NSString *)content size:(CGSize)size;

/**
 生成二维码
 
 @param urlString 二维码内容
 @param QRCodeSize 二维码大小
 @param logoImage 二维码 log
 @param logoImageSize log 大小
 @param cornerRadius log 圆角大小
 @return  返回生成的二维码
 */
+ (UIImage *)creatQRCodeWithURLString:(NSString *)urlString QRCodeSize:(CGSize)QRCodeSize logoImage:(UIImage *)logoImage logoImageSize:(CGSize)logoImageSize logoImageWithCornerRadius:(CGFloat)cornerRadius;
/**
 *  图片增加水印
 *
 *  @param superImage 需要增加水印的图片
 *  @param subImage   水印图片
 *  @param posRect    水印的位置 和 水印的大小
 *
 *  @return 加水印后的新图片
 */
+ (UIImage *)addImageToSuperImage:(UIImage *)superImage withSubImage:(UIImage *)subImage andSubImagePosition:(CGRect)posRect;
/**
 *  文字转图片
 *
 *  @param arrContent  文字数组
 *  @param fontSize   字体大小
 *  @param textColor   字体颜色
 *  @return image 对象
 */
+(UIImage *)imageFromText:(NSArray*) arrContent withFont: (CGFloat)fontSize textColor:(UIColor *)textColor;


    //图片从中心拉伸
+ (UIImage *)resizedImage:(UIImage *)image;


/**
 修改图片大小

 @param img 图片对象
 @param size 指定大小
 @return 返回新的图片
 */
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

/**
 等比缩放图片
 
 @param sourceImage 源图片
 @param size 缩放后的大小
 @return 生成新的图片
 */
-(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

/**
 等比缩放图片宽度

 @param sourceImage 源
 @param defineWidth 宽度
 @return 返回新的 image
 */
-(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
@end
