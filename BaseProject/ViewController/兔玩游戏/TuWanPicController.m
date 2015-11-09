//
//  TuWanPicController.m
//  BaseProject
//
//  Created by ios－07 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicController.h"
#import "TuWanPicViewModel.h"

@interface TuWanPicController ()<MWPhotoBrowserDelegate>

@property(nonatomic,strong)TuWanPicViewModel *picVM;
@end

@implementation TuWanPicController

- (instancetype)initWithAid:(NSString *)aid
{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}
/**  防御性编程*/
- (instancetype)init
{
    if (self = [super init]) {
        NSAssert(NO, @"%s 此处只允许使用initWithAid：初始化",__func__ );
    }
    return self;
}
- (TuWanPicViewModel *)picVM
{
    if (!_picVM) {
        _picVM = [[TuWanPicViewModel alloc]initWithAid:_aid];
    }
    return _picVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    /**  非xib storyboard 默认背景色为透明*/
    self.view.backgroundColor = [UIColor whiteColor];
/**  请求时要有正在操作的提示*/
    [self showProgress];
    [Factory addBackItemToVC:self];
    [self.picVM getDataFromNetCompleteHandle:^(NSError *error) {
//     创建图片展示页面 ,github 排名最高的图片展示类控件
        MWPhotoBrowser  *photoBrowser = [[MWPhotoBrowser alloc]initWithDelegate:self];
        [self.navigationController pushViewController:photoBrowser animated:YES];
//      图片展示页不应该是当前页推出的，而应该是取代当前页面在导航控制器的位置
        NSMutableArray *naviVcs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
//      删除最后一个控制器，即当前控制器
        [naviVcs removeLastObject];
//    把当前控制器添加到最后
        [naviVcs addObject:photoBrowser];
//       把新的控制器数组赋值给导航控制器
        self.navigationController.viewControllers = naviVcs;
    }];
    
    
    
}
#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.picVM.rowNumber;
}


- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.picVM picURLForRow:index]];
    return photo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
