//
//  ScheduleBottomBar.m
//  CyxbsMobile2019_iOS
//
//  Created by SSR on 2023/1/13.
//  Copyright © 2023 Redrock. All rights reserved.
//

#import "ScheduleBottomBar.h"
#import "RyTrottingHorseLampLabel.h"
#import <RyKit/UIView+YYAdd.h>
#import <RyKit/UIColor+YYAdd.h>
#import "UIColor+Dark.h"
#import "FontName.h"

#pragma mark - ScheduleBar ()

@interface ScheduleBottomBar ()

@property (nonatomic, strong) RyTrottingHorseLampLabel *lampLab;



@property (nonatomic, strong) UIImageView *timeImgView;

@property (nonatomic, strong) UILabel *timeLab;



@property (nonatomic, strong) UIImageView *placeImgView;

@property (nonatomic, strong) RyTrottingHorseLampLabel *placeLab;

// other view

@property (nonatomic, strong) UIView *bar;

@property (nonatomic, strong) UIView *line;

@end

#pragma mark - ScheduleBar

@implementation ScheduleBottomBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.lampLab];
        [self addSubview:self.timeImgView];
        [self addSubview:self.timeLab];
        [self addSubview:self.placeImgView];
        [self addSubview:self.placeLab];
        
        [self addSubview:self.bar];
        [self addSubview:self.line];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // centerY
    self.lampLab.centerY =
    self.timeImgView.centerY = self.timeLab.centerY =
    self.placeImgView.centerY = self.placeLab.centerY = self.height / 2;
    // left
    self.lampLab.left = 18;
    self.timeImgView.left = 0.384 * self.width;
    self.timeLab.left = self.timeImgView.right + 5;
    self.placeImgView.left = 0.7 * self.width;
    self.placeLab.left = self.placeImgView.right + 5;
    // width
    self.lampLab.width = self.timeImgView.left - self.lampLab.left - 18;
    self.timeLab.width = self.placeImgView.left - self.timeLab.left - 18;
    self.placeLab.width = self.width - self.placeLab.left - 18;
    // supplementry
    self.bar.centerX = self.width / 2;
    self.line.width = self.width;
    self.line.bottom = self.height;
}

#pragma mark - Lazy

- (RyTrottingHorseLampLabel *)lampLab {
    if (_lampLab == nil) {
        _lampLab = [[RyTrottingHorseLampLabel alloc] initWithFrame:CGRectMake(16, 0, 120, 30)];
        [_lampLab initLabelWithBlock:^(UILabel * _Nonnull label) {
            label.font = [UIFont fontWithName:FontName.PingFangSC.Semibold size:22];
            label.textColor = [UIColor Light:UIColorHex(#15315B) Dark:UIColorHex(#F0F0F2)];
        }];
    }
    return _lampLab;
}

- (UILabel *)_cycleLab {
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 25)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont fontWithName:FontName.PingFangSC.Semibold size:22];
    lab.textColor = [UIColor Light:UIColorHex(#15315B) Dark:UIColorHex(#F0F0F2)];
    return lab;
}

- (UIImageView *)timeImgView {
    if (_timeImgView == nil) {
        _timeImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"time"]];
        _timeImgView.left = self.width / 3 + 12;
        _timeImgView.size = CGSizeMake(12, 12);
        _timeImgView.centerY = self.height / 2;
    }
    return _timeImgView;
}

- (UILabel *)timeLab {
    if (_timeLab == nil) {
        _timeLab = [[UILabel alloc] init];
        _timeLab.font = [UIFont fontWithName:FontName.PingFangSC.Light size:12];
        _timeLab.textColor = [UIColor Light:UIColorHex(#15315B) Dark:UIColorHex(#F0F0F2)];
        _timeLab.size = CGSizeMake(120, 20);
        _timeLab.left = self.timeImgView.right + 5;
        _timeLab.centerY = self.timeImgView.centerY;
    }
    return _timeLab;
}

- (UIImageView *)placeImgView {
    if (_placeImgView == nil) {
        _placeImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"locale"]];
        _placeImgView.left = self.width / 3 * 2 + 9;
        _placeImgView.size = CGSizeMake(9, 12);
        _placeImgView.centerY = self.height / 2;
    }
    return _placeImgView;
}

- (RyTrottingHorseLampLabel *)placeLab {
    if (_placeLab == nil) {
        _placeLab = [[RyTrottingHorseLampLabel alloc] init];
        _placeLab.size = CGSizeMake(120, 20);
        [_placeLab initLabelWithBlock:^(UILabel * _Nonnull label) {
            label.font = [UIFont fontWithName:FontName.PingFangSC.Light size:12];
            label.textColor = [UIColor Light:UIColorHex(#15315B) Dark:UIColorHex(#F0F0F2)];
        }];
        _placeLab.left = self.placeImgView.right + 5;
        _placeLab.centerY = self.placeImgView.centerY;
    }
    return _placeLab;
}

- (UIView *)bar {
    if (_bar == nil) {
        _bar = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 27, 5)];
        _bar.layer.cornerRadius = _bar.height / 2;
        _bar.backgroundColor = [UIColor Light:UIColorHex(#E2EDFB) Dark:UIColorHex(#5A5A5A)];
    }
    return _bar;
}

- (UIView *)line {
    if (_line == nil) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
        _line.backgroundColor = [UIColor Light:UIColorHex(#EAEDF1) Dark:UIColorHex(#7C7C7C)];
    }
    return _line;
}

#pragma mark - setter

- (void)setTitle:(NSString *)title {
    _title = title;
    [self.lampLab initLabelWithBlock:^(UILabel * _Nonnull label) {
        label.text = title;
        [label sizeToFit];
    }];
    [self.lampLab animationPrepare:^(id<RyTrottingHorseLampLabelAnimationContext>  _Nonnull context) {
        context.hoverDuration = 2;
        context.animationDuration = 4;
        context.spacing = 60;
    }];
}

- (void)setTime:(NSString *)time {
    self.timeLab.text = time.copy;
    [self.timeLab sizeToFit];
}

- (void)setPlace:(NSString *)place {
    _place = place;
    [self.placeLab initLabelWithBlock:^(UILabel * _Nonnull label) {
        label.text = place;
        [label sizeToFit];
        self.placeLab.height = label.height;
    }];
    [self.placeLab animationPrepare:^(id<RyTrottingHorseLampLabelAnimationContext>  _Nonnull context) {
        context.hoverDuration = 2;
        context.animationDuration = 4;
        context.spacing = 60;
    }];
}

#pragma mark - getter

- (NSString *)time {
    return self.timeLab.text.copy;
}

@end
