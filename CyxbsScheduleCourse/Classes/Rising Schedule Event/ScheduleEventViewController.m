//
//  ScheduleEventViewController.m
//  CyxbsMobile2019_iOS
//
//  Created by SSR on 2023/4/3.
//  Copyright © 2023 Redrock. All rights reserved.
//

#import "ScheduleEventViewController.h"
#import "ScheduleEventTableViewHeaderView.h"
#import "ScheduleEventTableViewCell.h"
#import "ScheduleShareCache.h"
#import <RyKit/UIView+YYAdd.h>
#import <RyKit/UIColor+YYAdd.h>
#import "UIColor+Dark.h"
#import "UIView+ShareUI.h"

@interface ScheduleEventViewController () <
    UITableViewDelegate,
    UITableViewDataSource,
    ScheduleEventTableViewCellDelegate,
    ScheduleEventTableViewHeaderViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ScheduleEventViewController {
    NSArray *_eventNameAry, *_cacheKeyAry;
}

- (void)loadView {
    [super loadView];
    
    _cacheKeyAry = @[
        ScheduleWidgetCacheKeyMain, ScheduleWidgetCacheKeyCustom, ScheduleWidgetCacheKeyOther
    ];
    
    self.navigationItem.title = @"Reminder";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(_cancel)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =
    [UIColor Light:UIColorHex(#FFFFFF)
              Dark:UIColorHex(#1D1D1D)];
    [self.view addSubview:self.tableView];
}

#pragma mark - Lazy

- (UITableView *)tableView {
    if (_tableView == nil) {
        CGFloat left = 20, height = RyStatusHeight();
        CGFloat top = self.navigationController.navigationBar.height + height + 5;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(left, top, self.view.width - 2 * 20, self.view.height - top) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColor.clearColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.bounces = NO;
        [_tableView registerClass:ScheduleEventTableViewHeaderView.class forHeaderFooterViewReuseIdentifier:ScheduleEventTableViewHeaderViewReuseIdentifier];
        [_tableView registerClass:ScheduleEventTableViewCell.class forCellReuseIdentifier:ScheduleEventTableViewCellReuseIdentifier];
    }
    return _tableView;
}

#pragma mark - Private

- (void)_cancel {
    UIViewController *vc = (self.navigationController ? self.navigationController : self);
    [vc dismissViewControllerAnimated:YES completion:nil];
}

- (void)_setIndexPath:(NSIndexPath *)indexPath status:(BOOL)status withCell:(BOOL)cellChange {
//    ScheduleIdentifier *key = [ScheduleShareCache.shareCache getKeyWithKeyName:_cacheKeyAry[indexPath.row] usingSupport:YES];
//    [ScheduleShareCache.shareCache setKey:key.key forName:_eventNameAry[indexPath.section] onStatus:status];
    if (cellChange) {
        ScheduleEventTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.switchOn = status;
    }
}

- (void)_alertTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle handler:(void (^ __nullable)(UIAlertAction *action))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:handler];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _eventNameAry.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cacheKeyAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ScheduleEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ScheduleEventTableViewCellReuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
//    ScheduleIdentifier *key = [ScheduleShareCache.shareCache getKeyWithKeyName:_cacheKeyAry[indexPath.row] usingSupport:YES];
//    BOOL switchStatus = [ScheduleShareCache.shareCache statusForKey:key.key withName:_eventNameAry[indexPath.section]];
    
//    NSString *type = @"无类型";
//    if (key.type == ScheduleModelRequestStudent) { type = @"学生课表"; }
//    if (key.type == ScheduleModelRequestCustom) { type = @"自定义事务"; }
//    if (key.type == ScheduleModelRequestTeacher) { type = @"教师课表"; }
    
//    cell.title = [NSString stringWithFormat:@"学号:%@ - %@", key.sno, type];
//    cell.switchOn = switchStatus;
    
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ScheduleEventTableViewHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ScheduleEventTableViewHeaderViewReuseIdentifier];
    view.section = section;
    view.delegate = self;
    if (section == 0) {
        view.title = @"小组件";
        view.btnDetail = @"刷新";
    }
    if (section == 1) {
        view.title = @"本地通知";
        view.btnDetail = @"更新";
    }
    if (section == 2) {
        view.title = @"日历";
        view.btnDetail = @"同步";
    }
    return view;
}

#pragma mark - <ScheduleEventTableViewHeaderViewDelegate>

- (void)tableViewHeaderView:(ScheduleEventTableViewHeaderView *)view didResponseBtn:(UIButton *)btn {
    if (view.section == 0) {
        if (@available(iOS 14.0, *)) {
            [self _alertTitle:@"小组件更新成功" message:@"请添加小组件或直接查看小组件" actionTitle:@"确定" handler:^(UIAlertAction *action) {
            }];
        } else {
            [self _alertTitle:@"小组件更新失败" message:@"未达到iOS 14.0，请更新系统" actionTitle:@"确定" handler:^(UIAlertAction *action) {
            }];
        }
    }
    if (view.section == 1) {
        [self _alertTitle:@"本地通知暂时没写" message:@"请等待开发者开发该功能，感谢支持" actionTitle:@"确定" handler:^(UIAlertAction *action) {
        }];
    }
    if (view.section == 2) {
        [self _alertTitle:@"同步到日历暂时没写" message:@"请等待开发者开发该功能，感谢支持" actionTitle:@"确定" handler:^(UIAlertAction *action) {
        }];
    }
}

#pragma mark - <ScheduleEventTableViewCellDelegate>

- (void)tableViewCell:(ScheduleEventTableViewCell *)cell didResponseSwitch:(UISwitch *)swi {
    NSIndexPath *idxPath = [self.tableView indexPathForCell:cell];
    if (swi.on) {
        for (NSInteger row = 0; row <= idxPath.row; row++) {
            [self _setIndexPath:[NSIndexPath indexPathForRow:row inSection:idxPath.section] status:YES withCell:YES];
        }
    } else {
        for (NSInteger row = idxPath.row; row < _cacheKeyAry.count; row++) {
            [self _setIndexPath:[NSIndexPath indexPathForRow:row inSection:idxPath.section] status:NO withCell:YES];
        }
    }
}

@end
