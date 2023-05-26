//
//  UIColor+Dark.m
//  AFNetworking
//
//  Created by SSR on 2023/5/26.
//

#import "UIColor+Dark.h"

#import <FluentDarkModeKit/FluentDarkModeKit.h>

@implementation UIColor (Dark)

+ (UIColor *)Light:(UIColor *)lightColor Dark:(UIColor *)darkColor {
    return [UIColor dm_colorWithLightColor:lightColor darkColor:darkColor];
}

+ (UIColor *)ry_colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    return [UIColor dm_colorWithLightColor:lightColor darkColor:darkColor];
}

@end
