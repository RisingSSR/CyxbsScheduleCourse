//
//  ScheduleCollectionViewCell.m
//  CyxbsMobile2019_iOS
//
//  Created by SSR on 2022/9/5.
//  Copyright © 2022 Redrock. All rights reserved.
//

#import "ScheduleCollectionViewCell.h"
#import <RyKit/UIView+YYAdd.h>
#import <RyKit/UIColor+YYAdd.h>
#import "UIColor+Dark.h"
#import "FontName.h"

NSString *ScheduleCollectionViewCellReuseIdentifier = @"ScheduleCollectionViewCell";

#pragma mark - ScheduleCollectionViewCell ()

@interface ScheduleCollectionViewCell ()

/// 标题
@property (nonatomic, strong) UILabel *titleLab;

/// 细节
@property (nonatomic, strong) UILabel *contentLab;

/// 多人
@property (nonatomic, strong) UIView *multyView;

@property (nonatomic, strong) UIImageView *backImgView;

@end

#pragma mark - ScheduleCollectionViewCell

@implementation ScheduleCollectionViewCell

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _drawType = -1;
        self.backgroundColor = UIColor.clearColor;
        self.contentView.layer.cornerRadius = 8;
        self.contentView.clipsToBounds = YES;
        [self.contentView addSubview:self.backImgView];
        [self.contentView addSubview:self.multyView];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.contentLab];
    }
    return self;
}

#pragma mark - Method

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    CGRect frame = layoutAttributes.frame;
    
    self.backImgView.size = frame.size;
    
    self.multyView.right = frame.size.width - 5;
    
    self.titleLab.width = frame.size.width - 2 * self.titleLab.left;
    
    self.contentLab.left = self.titleLab.left;
    self.contentLab.width = self.titleLab.width;
    self.contentLab.bottom = frame.size.height - 8;
}

#pragma mark - Getter

- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, -1, -1)];
        _titleLab.backgroundColor = UIColor.clearColor;
        _titleLab.numberOfLines = 3;
        _titleLab.font = [UIFont fontWithName:FontName.PingFangSC.Regular size:10];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (_contentLab == nil) {
        _contentLab = [[UILabel alloc] init];
        _contentLab.backgroundColor = UIColor.clearColor;
        _contentLab.numberOfLines = 3;
        _contentLab.font = [UIFont fontWithName:FontName.PingFangSC.Regular size:10];
        _contentLab.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLab;
}

- (UIView *)multyView {
    if (_multyView == nil) {
        _multyView = [[UIView alloc] initWithFrame:CGRectMake(-1, 4, 8, 2)];
        _multyView.layer.cornerRadius = _multyView.height / 2;
        _multyView.clipsToBounds = YES;
        _multyView.hidden = YES;
    }
    return _multyView;
}

- (UIImageView *)backImgView {
    if (_backImgView == nil) {
        _backImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lineline"]];
        _backImgView.contentMode = UIViewContentModeScaleAspectFill;
        _backImgView.hidden = YES;
    }
    return _backImgView;
}

- (NSString *)courseTitle {
    return self.titleLab.text.copy;
}

- (NSString *)courseContent {
    return self.contentLab.text.copy;
}

- (BOOL)isMuti {
    return !self.multyView.hidden;
}

- (BOOL)oneLenth {
    return self.contentLab.hidden;
}

#pragma mark - Setter

- (void)setCourseTitle:(NSString *)courseTitle {
    self.titleLab.text = courseTitle.copy;
    CGFloat width = self.titleLab.width;
    [self.titleLab sizeToFit];
    self.titleLab.width = width;
}

- (void)setCourseContent:(NSString *)courseContent {
    self.contentLab.text = courseContent.copy;
    CGFloat width = self.contentLab.width;
    CGFloat bottom = self.contentLab.bottom;
    [self.contentLab sizeToFit];
    self.contentLab.width = width;
    self.contentLab.bottom = bottom;
}

- (void)setIsMuti:(BOOL)isMuti {
    self.multyView.hidden = !isMuti;
}

- (void)setOneLenth:(BOOL)oneLenth  {
    self.contentLab.hidden = oneLenth;
}

- (void)setDrawType:(ScheduleCollectionViewCellDrawType)drawType {
    if (_drawType == drawType) {
        return;
    }
    _drawType = drawType;
    
    switch (drawType) {
        /*ScheduleCollectionViewCellDrawMorning*/
        case ScheduleCollectionViewCellDrawMorning: {
            self.contentView.backgroundColor =
            [UIColor Light:UIColorHex(#F9E7D8) Dark:UIColorHex(#FFCCA126)];
            
            self.titleLab.textColor = self.contentLab.textColor = self.multyView.backgroundColor =
            [UIColor Light:UIColorHex(#FF8015) Dark:UIColorHex(#F0F0F2CC)];
        } break;
            
        /*ScheduleCollectionViewCellDrawAfternoon*/
        case ScheduleCollectionViewCellDrawAfternoon: {
            self.contentView.backgroundColor =
            [UIColor Light:UIColorHex(#F9E3E4) Dark:UIColorHex(#FF979B26)];
            
            self.titleLab.textColor = self.contentLab.textColor = self.multyView.backgroundColor =
            [UIColor Light:UIColorHex(#FF6262) Dark:UIColorHex(#F0F0F2CC)];
        } break;
            
        /*ScheduleCollectionViewCellDrawNight*/
        case ScheduleCollectionViewCellDrawNight: {
            self.contentView.backgroundColor =
            [UIColor Light:UIColorHex(#DDE3F8) Dark:UIColorHex(#9BB2FB26)];
            
            self.titleLab.textColor = self.contentLab.textColor = self.multyView.backgroundColor =
            [UIColor Light:UIColorHex(#4066EA) Dark:UIColorHex(#F0F0F2CC)];
        } break;
            
        /*ScheduleCollectionViewCellDrawOthers*/
        case ScheduleCollectionViewCellDrawOthers: {
            self.contentView.backgroundColor =
            [UIColor Light:UIColorHex(#DFF3FC) Dark:UIColorHex(#90DBFB26)];
            
            self.titleLab.textColor = self.contentLab.textColor = self.multyView.backgroundColor =
            [UIColor Light:UIColorHex(#06A3FC) Dark:UIColorHex(#F0F0F2CC)];
        } break;
            
        default: break;
    }
    
    /*ScheduleCollectionViewCellDrawCustom*/
    if (_drawType == ScheduleCollectionViewCellDrawCustom) {
        self.backImgView.hidden = NO;
        self.titleLab.textColor = self.contentLab.textColor = self.multyView.backgroundColor =
        [UIColor Light:UIColor.blackColor Dark:UIColor.whiteColor];
    } else {
        self.backImgView.hidden = YES;
    }
}

@end
