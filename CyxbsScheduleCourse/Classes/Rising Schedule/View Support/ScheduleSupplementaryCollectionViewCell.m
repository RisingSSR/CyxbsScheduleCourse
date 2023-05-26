//
//  ScheduleSupplementaryCollectionViewCell.m
//  CyxbsMobile2019_iOS
//
//  Created by SSR on 2022/9/19.
//  Copyright © 2022 Redrock. All rights reserved.
//

#import "ScheduleSupplementaryCollectionViewCell.h"
#import <RyKit/UIView+YYAdd.h>
#import <RyKit/UIColor+YYAdd.h>
#import "UIColor+Dark.h"
#import "FontName.h"

NSString *ScheduleSupplementaryCollectionViewCellReuseIdentifier = @"ScheduleSupplementaryCollectionViewCell";

#pragma mark - ScheduleSupplementaryCollectionViewCell ()

@interface ScheduleSupplementaryCollectionViewCell ()

/// 标题
@property (nonatomic, strong) UILabel *titleLab;

/// 细节
@property (nonatomic, strong) UILabel *contentLab;

/// 布局
@property (nonatomic, strong) UICollectionViewLayoutAttributes *attributes;

@end

#pragma mark - ScheduleSupplementaryCollectionViewCell

@implementation ScheduleSupplementaryCollectionViewCell

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 8;
        self.contentView.clipsToBounds = YES;
        self.backgroundColor = UIColor.clearColor;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.contentLab];
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    _attributes = layoutAttributes;
    
    self.contentLab.left = self.titleLab.left = 0;
    self.contentLab.width = self.titleLab.width = layoutAttributes.size.width;
    
    if (self.isTitleOnly) {
        self.titleLab.centerY = _attributes.size.height / 2;
        self.contentLab.hidden = YES;
    } else {
        self.titleLab.top = 6;
        self.contentLab.hidden = NO;
    }
    
    self.contentLab.bottom = _attributes.size.height - 3;
}

#pragma mark - Method

- (void)setIsCurrent:(BOOL)isCurrent {
    if (_isCurrent == isCurrent) {
        return;
    }
    _isCurrent = isCurrent;
    
    if (isCurrent) {
        self.contentView.backgroundColor =
        [UIColor Light:UIColorHex(#2A4E84) Dark:UIColorHex(#5A5A5ACC)];
        self.titleLab.textColor =
        [UIColor Light:UIColorHex(#FFFFFF) Dark:UIColorHex(#F0F0F2)];
        self.contentLab.textColor =
        [UIColor Light:UIColorHex(#FFFFFF64) Dark:UIColorHex(#868686)];
    } else {
        self.contentView.backgroundColor = UIColor.clearColor;
        self.titleLab.textColor =
        [UIColor Light:UIColorHex(#15315B) Dark:UIColorHex(#F0F0F2)];
        self.contentLab.textColor =
        [UIColor Light:UIColorHex(#606E8A) Dark:UIColorHex(#868686)];
    }
}

#pragma mark - Getter

- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 6, -1, 20)];
        _titleLab.backgroundColor = UIColor.clearColor;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.numberOfLines = 2;
        _titleLab.font = [UIFont fontWithName:FontName.PingFangSC.Regular size:12];
        _titleLab.textColor =
        [UIColor Light:UIColorHex(#15315B) Dark:UIColorHex(#F0F0F2)];
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (_contentLab == nil) {
        _contentLab = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLab.left, -1, -1, 20)];
        _contentLab.backgroundColor = UIColor.clearColor;
        _contentLab.textAlignment = NSTextAlignmentCenter;
        _contentLab.font = [UIFont fontWithName:FontName.PingFangSC.Regular size:11];
        _contentLab.textColor =
        [UIColor Light:UIColorHex(#606E8A) Dark:UIColorHex(#868686)];
    }
    return _contentLab;
}

- (NSString *)title {
    return self.titleLab.text.copy;
}

- (NSString *)content {
    return self.titleLab.text.copy;
}

#pragma mark - Setter

- (void)setTitle:(NSString *)title {
    self.titleLab.text = title.copy;
}

- (void)setContent:(NSString *)content {
    self.contentLab.text = content.copy;
}

- (void)setIsTitleOnly:(BOOL)isTitleOnly {
    _isTitleOnly = isTitleOnly;
    if (_attributes) {
        [self applyLayoutAttributes:_attributes];
    }
}

@end
