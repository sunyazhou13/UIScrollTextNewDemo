//
//  YZUtilTool.h
//  siyu_im
//
//  Created by SUNYAZHOU on 2021/1/19.
//  Copyright © 2021 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZUtilTool:NSObject


/// 安全区 上左下右的边界
+ (UIEdgeInsets)yz_safeAreaInsets;

/// 渐变图片
+ (UIImage *)gradientFromColor:(UIColor *)fromeColor toColor:(UIColor *)toColor andSize:(CGSize)imageSize;

@end

NS_ASSUME_NONNULL_END
