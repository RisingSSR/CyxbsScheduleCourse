//
//  ScheduleController.m
//  CyxbsMobile2019_iOS
//
//  Created by SSR on 2022/8/24.
//  Copyright © 2022 Redrock. All rights reserved.
//

#import "ScheduleController.h"
#import "SchedulePresenter.h"
#import "ScheduleHeaderView.h"
#import "UIColor+Dark.h"
#import <RyKit/UIColor+YYAdd.h>
#import <RyKit/UIView+YYAdd.h>

static CGFloat (^statusHeight)(void) = ^{
    if (@available(iOS 13.0, *)) {
        return UIApplication. sharedApplication.windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height;
    }
    return [UIApplication sharedApplication].statusBarFrame.size.height;
};

@interface ScheduleController ()

/// header view
@property (nonatomic, strong) ScheduleHeaderView *headerView;

/// 课表视图
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ScheduleController

- (instancetype)initWithPresenter:(SchedulePresenter *)presenter {
    self = [super init];
    if (self) {
        _presenter = presenter;
        presenter.controller = self;
    }
    return self;
}

#pragma mark - Life cycle

- (void)loadView {
    [super loadView];
    self.view.backgroundColor =
    [UIColor Light:UIColorHex(#FFFFFF)
              Dark:UIColorHex(#1D1D1D)];
    if (self.modalPresentationStyle == UIModalPresentationCustom) {
        self.view.height -= statusHeight();
        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
        view.backgroundColor = self.view.backgroundColor;
        self.view.backgroundColor = UIColor.clearColor;
        self.view.layer.shadowRadius = 16;
        self.view.layer.shadowColor = [UIColor Light:UIColor.lightGrayColor Dark:UIColor.darkGrayColor].CGColor;
        self.view.layer.shadowOpacity = 0.7;
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(20, 20)];
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
        shapeLayer.frame = view.bounds;
        shapeLayer.path = bezierPath.CGPath;
        view.layer.mask = shapeLayer;
        
        [self.view insertSubview:view atIndex:0];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.presenter.headerView = self.headerView;
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.collectionView];
    
    [self.presenter requestAndReloadDataWithRollback:YES];
}

#pragma mark - Getter

- (ScheduleHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [[ScheduleHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
        CGFloat top = 0;
        if (self.modalPresentationStyle != UIModalPresentationCustom){
            top = statusHeight();
        }
        _headerView.top = top;
    }
    return _headerView;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        [self.presenter setingCollectionView:(&_collectionView) withPrepareWidth:self.view.width];
        _collectionView.top = self.headerView.bottom;
        _collectionView.height = self.view.height - _collectionView.top;
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, self.tabBarController.tabBar.height, 0);
        _collectionView.directionalLockEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
        _collectionView.backgroundColor =
        [UIColor Light:UIColorHex(#FFFFFF)
                  Dark:UIColorHex(#1D1D1D)];
    }
    return _collectionView;
}

@end
