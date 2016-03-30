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

@property (weak) NSMutableArray *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CMLTableView

#pragma mark - Life Cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UINib *nib = [UINib nibWithNibName:@"CMLTableView" bundle:[NSBundle mainBundle]];
        NSArray *array = [nib instantiateWithOwner:self options:nil];
        self = [array objectAtIndex:0];
    }
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
    
    [self addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer forIndexPath:indexPath];
    
    cell.clipsToBounds = YES;
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}
@end