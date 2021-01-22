//
//  YZUtilTool.m
//  siyu_im
//
//  Created by SUNYAZHOU on 2021/1/19.
//  Copyright © 2021 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "YZUtilTool.h"

@implementation YZUtilTool

+ (UIEdgeInsets)yz_safeAreaInsets {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    if (![window isKeyWindow]) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        if (CGRectEqualToRect(keyWindow.bounds, [UIScreen mainScreen].bounds)) {
            window = keyWindow;
        }
    }
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets insets = [window safeAreaInsets];
        return insets;
    }
    return UIEdgeInsetsZero;
}

+ (UIImage *)gradientFromColor:(UIColor *)fromeColor toColor:(UIColor *)toColor andSize:(CGSize)imageSize {
    if (fromeColor == nil) { fromeColor = [UIColor clearColor]; }
    if (toColor == nil) { toColor = [UIColor clearColor]; }
    NSArray* gradientColors = [NSArray arrayWithObjects: (id)fromeColor.CGColor, (id)toColor.CGColor, nil];
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([fromeColor CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, NULL);
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(imageSize.width, 0.0);
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();
    return image;
}

@end
