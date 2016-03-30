//
//  ViewController.m
//  UITableViewSample
//
//  Created by Gyroball on 2016/03/29.
//  Copyright © 2016年 Yuhei Okubo. All rights reserved.
//

#import "CMLViewController.h"
#import "CMLTableView.h"

@interface CMLViewController ()

@end

@implementation CMLViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View
- (void)setView
{
    [self loadXib];
    [self setNavigation];
}

- (void)setNavigation
{
    self.navigationController.navigationBarHidden = NO;
}
- (void)loadXib
{
    CMLTableView *tableView = [[NSBundle mainBundle] loadNibNamed:@"CMLTableView" owner:self options:nil][0];
    tableView.frame = CGRectMake(self.view.frame.origin.x,
                                 self.view.frame.origin.y,
                                 self.view.frame.size.width,
                                self.view.frame.size.height);

    [self.view addSubview:tableView];
}
@end
