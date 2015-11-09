//
//  RankListViewController.m
//  BaseProject
//
//  Created by ios－07 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "RankingListViewModel.h"
#import "XiMaCategoryCell.h"

@interface RankListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)RankingListViewModel *rankVM;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation RankListViewController

+ (UINavigationController *)defaultnavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController *vc = [RankListViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

- (RankingListViewModel *)rankVM
{
    if (!_rankVM) {
        _rankVM = [[RankingListViewModel alloc]init];
    }
    return _rankVM;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XiMaCategoryCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 在导航上 添加菜单按钮*/
    [Factory addMenuItemToVc:self];
    self.title = @"音乐TOP50";
    //    添加表格
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    /** 刷新 */
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.rankVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                //  DDLogError(@"%@",error.userInfo);
                [self showErrorMsg:error];
            }else{
                [self.tableView reloadData];
            }
            /**  重置脚步 没有更多数据*/
            [self.tableView.footer resetNoMoreData];
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
    /** 加载更多*/
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.rankVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
                if (error.code == 999) {
                    [self.tableView.footer endRefreshingWithNoMoreData];
                }
            }else{
                [self.tableView reloadData];
                
            }
           
            [self.tableView.footer endRefreshing];
        }];
    }];
    
}
#pragma mark - UITableView Delegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rankVM.rowCount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    XiMaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.orderLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    [cell.iconIV.imageView setImageWithURL:[self.rankVM imgForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    
    cell.titleLabel.text = [self.rankVM titleForRow:indexPath.row];
    cell.descLabel.text = [self.rankVM introForRow:indexPath.row];
    cell.numberlabel.text = [self.rankVM tracksForRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0;
}




























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
