//
//  CMLTableView.m
//  UITableViewSample
//
//  Created by Gyroball on 2016/03/29.
//  Copyright © 2016年 Yuhei Okubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMLTableView.h"

@interface CMLTableView() <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) float statusbarHeight;

@end

@implementation CMLTableView

#pragma mark - Life Cycle
- (id)init
{
    self = [super init];
    
    return self;
}
- (void)layoutSubviews
{
    [self setView];
}

#pragma mark - Data
- (void)setData
{
    NSMutableArray *data = @[].mutableCopy;
    [data addObject:@"sample1"];
    [data addObject:@"sample2"];
    [data addObject:@"sample3"];
    [data addObject:@"sample4"];
    [data addObject:@"sample5"];
    [data addObject:@"sample6"];
    [data addObject:@"sample7"];
    [data addObject:@"sample8"];
    [data addObject:@"sample9"];
    [data addObject:@"sample10"];
    
    _dataArray = data;
}

#pragma mark - View
- (void)setView
{
    [self setData];
    [self setTableView];
}

- (void)setTableView
{
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.frame = CGRectMake(self.frame.origin.x,
                                  self.frame.origin.y,
                                  self.frame.size.width,
                                  self.frame.size.height);
    
    [self addSubview:_tableView];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell = [self updateCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (UITableViewCell *)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}

@end