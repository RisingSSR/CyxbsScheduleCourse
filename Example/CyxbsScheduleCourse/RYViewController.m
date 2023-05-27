//
//  RYViewController.m
//  CyxbsScheduleCourse
//
//  Created by RisingSSR on 05/24/2023.
//  Copyright (c) 2023 RisingSSR. All rights reserved.
//

#import "RYViewController.h"
#import "ScheduleController.h"
#import "SchedulePresenter.h"
#import "ScheduleCollectionViewLayout.h"
#import "ScheduleMapModel.h"

@interface RYViewController ()

@end

@implementation RYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SchedulePresenter *pr = [[SchedulePresenter alloc] initWithDouble];
    ScheduleController *vc = [[ScheduleController alloc] initWithPresenter:pr];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
