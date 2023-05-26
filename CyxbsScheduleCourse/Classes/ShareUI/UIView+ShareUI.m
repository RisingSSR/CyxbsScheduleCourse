//
//  UIView+ShareUI.m
//  CyxbsScheduleCourse
//
//  Created by SSR on 2023/5/26.
//

#import "UIView+ShareUI.h"

@implementation UIView (ShareUI)

- (void)addGradientBlueLayer {
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = self.bounds;
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[
        (__bridge id)[UIColor colorWithRed:72.0 / 255 green:65.0 / 255 blue:226.0 / 255 alpha:1].CGColor,
        (__bridge id)[UIColor colorWithRed:93.0 / 255 green:93.0 / 255 blue:247.0 / 255 alpha:1].CGColor
    ];
    gl.locations = @[@(0), @(1.0f)];
    [self.layer addSublayer: gl];
}

@end
