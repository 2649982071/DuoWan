//
//  RankingListViewModel.h
//  BaseProject
//
//  Created by ios－07 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface RankingListViewModel : BaseViewModel
/**  数据的条数 */
@property(nonatomic,assign)NSInteger rowCount;
/**  数据来源的当前 页数 */
@property(nonatomic,assign)NSInteger pageId;
/**  当前数据对应的数据ID */
- (NSInteger)albumIDForRow:(NSInteger)row;
// 最大页数
@property(nonatomic,assign)NSInteger maxPageId;
/**  某条数据的title */
- (NSString *)titleForRow:(NSInteger)row;
/**  某条数据的描述 */
- (NSString *)introForRow:(NSInteger)row;
/**  某条数据的图片 */
- (NSURL *)imgForRow:(NSInteger)row;
/**  集数 */
- (NSString *)tracksForRow:(NSInteger)row;



@end
