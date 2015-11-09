//
//  LeftViewController.m
//  BaseProject
//
//  Created by ios－07 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import <NSString+Icons.h>
#import "RankListViewController.h"
#import "TuWanViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *itenNames;
@end

@implementation LeftViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
    }
    return _tableView;
}
- (NSArray *)itenNames
{
    return @[@"游戏资讯",@"喜马拉雅",@"英雄联盟",@"个人设置"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 //   self.view.backgroundColor = [UIColor blueColor];
    /**  触发 tableView 的懒加载*/
    [self.tableView reloadData];
    
    
}
#pragma mark UITableView Delegate  DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itenNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.itenNames[indexPath.row];
    cell.accessoryType = 1;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}
kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[TuWanViewController standradTuWanNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
          case 1:
            [self.sideMenuViewController setContentViewController:[RankListViewController defaultnavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
