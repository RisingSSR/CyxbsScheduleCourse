//
//  UIColor+Dark.h
//  AFNetworking
//
//  Created by SSR on 2023/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Dark)

+ (UIColor *)Light:(UIColor *)lightColor Dark:(UIColor *)darkColor;

+ (UIColor *)ry_colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

@end

NS_ASSUME_NONNULL_END
