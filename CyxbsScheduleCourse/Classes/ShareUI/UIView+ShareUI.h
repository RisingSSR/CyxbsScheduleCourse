//
//  UIView+ShareUI.h
//  AFNetworking
//
//  Created by SSR on 2023/5/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static CGFloat (^RyStatusHeight)(void) = ^{
    if (@available(iOS 13.0, *)) {
        return UIApplication. sharedApplication.windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height;
    }
    return [UIApplication sharedApplication].statusBarFrame.size.height;
};

@interface UIView (ShareUI)

/// 添加渐变蓝色
- (void)addGradientBlueLayer;

@end

NS_ASSUME_NONNULL_END
