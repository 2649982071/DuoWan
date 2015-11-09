//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListCell.h"
#import "TuWanImageCell.h"
#import "iCarousel.h"
#import "TuWanHtmlController.h"
#import "TuWanVideoController.h"
#import "TuWanPicController.h"

@interface TuWanListViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)TuWanViewModel *tuWanVM;

@end

@implementation TuWanListViewController
{ //  添加成员变量 因为不需要懒加载 ，所以不需要属性
    iCarousel *_ic;
    UIPageControl *_pageColtrol;
    UILabel *_titleLb;
    NSTimer *_timer;
}

- (UIView *)headerView{
    [_timer invalidate];
    //  如果当前没有头部视图 返回nil
    if (!self.tuWanVM.isExistIndexPic) {
        return nil;
    }
/**   头部视图  origin 无效 宽度无效 与table同宽 */
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500)];
    
/**  添加底部视图*/
    UIView *buttomView = [[UIView alloc]init];
    buttomView.backgroundColor = kRGBColor(240, 240, 240);
    [headerView addSubview:buttomView];
    [buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [buttomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageColtrol = [UIPageControl new];
    _pageColtrol.numberOfPages = self.tuWanVM.indexPicNumber;
    [buttomView addSubview:_pageColtrol];
    [_pageColtrol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.tuWanVM titleForRowInIndexPic:0];
    /**  添加滚动栏*/
    _ic = [iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(buttomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES; // 翻页形式
    _ic.scrollSpeed = 1; // 滚动速度
    //       如果只有一张图，则不显示圆点
    _pageColtrol.userInteractionEnabled = NO; // 不允许与用户交互 
    _pageColtrol.hidesForSinglePage = YES;
    _ic.scrollEnabled = self.tuWanVM.indexPicNumber != 1;
    _pageColtrol.pageIndicatorTintColor = [UIColor redColor];
    _pageColtrol.currentPageIndicatorTintColor = [UIColor blueColor];
    if (self.tuWanVM.indexPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    /**  测试一下 */
    return headerView;
}

- (TuWanViewModel *)tuWanVM
{
    if (!_tuWanVM) {
        _tuWanVM = [[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuWanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuWanVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
            
        }];
    }];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.tuWanVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuWanVM.rowCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    
    if ([self.tuWanVM containImages:indexPath.row]) {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLabel.text = [self.tuWanVM titleForRow:indexPath.row];
        cell.clicksLabel.text = [self.tuWanVM clickForRow:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"share_qq"]];
         [cell.iconIV1.imageView setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"share_qq"]];
         [cell.iconIV2.imageView setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"share_qq"]];
        return cell;
    }
    // placeholderImage 当图片没有下载完成之前显示的文件
    [cell.imgView.imageView setImageWithURL:[self.tuWanVM imgPathForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_album_bg"]];
    cell.titleLabel.text = [self.tuWanVM titleForRow:indexPath.row];
    cell.longTitleLabel.text = [self.tuWanVM descriptionForRow:indexPath.row];
    cell.clicksLabel.text = [self.tuWanVM clickForRow:indexPath.row];
    
    
    return cell;
}
//  去掉分割线左侧缝隙
kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.tuWanVM isHtmlInListForRow:indexPath.row]) {
        TuWanHtmlController *vc = [[TuWanHtmlController alloc]initWithURL:[self.tuWanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuWanVM isVideoInListForRow:indexPath.row]) {
        TuWanVideoController *vc = [[TuWanVideoController alloc]initWithURL:[self.tuWanVM detailURLForRowInList:indexPath.row]];
     //   [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuWanVM isPicInListForRow:indexPath.row]) {
        TuWanPicController *pic = [[TuWanPicController alloc]initWithAid:[self.tuWanVM aidInListForRow:indexPath.row]];
        [self.navigationController pushViewController:pic animated:YES];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.tuWanVM containImages:indexPath.row]?135:90;
}
#pragma mark - iCarousel Delegate

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.tuWanVM.indexPicNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750*500-35)];
        UIImageView *imageView  = [[UIImageView alloc]init];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = [view viewWithTag:100];
    [imageView setImageWithURL:[self.tuWanVM iconForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"w_xue"]];
    return view;
}
//  允许循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if ([self.tuWanVM isHtmlInIndexPicForRow:index]) {
        TuWanHtmlController *vc = [[TuWanHtmlController alloc]initWithURL:[self.tuWanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuWanVM isPicInIndexPicForRow:index]) {
        TuWanPicController *pic = [[TuWanPicController alloc]initWithAid:[self.tuWanVM aidInIndexPicForRow:index]];
        [self.navigationController pushViewController:pic animated:YES];
    }
    if ([self.tuWanVM isVideoInIndexPicFowRow:index]) {
        TuWanVideoController *vc = [[TuWanVideoController alloc]initWithURL:[self.tuWanVM detailURLForRowInIndexPic:index]];
     //   [self.navigationController pushViewController:vc animated:YES];
    }
    
}
/**   监控滚动到当前第几个*/
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
   // NSLog(@"%ld",carousel.currentItemIndex);
    _titleLb.text = [self.tuWanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageColtrol.currentPage = carousel.currentItemIndex;
}
@end
