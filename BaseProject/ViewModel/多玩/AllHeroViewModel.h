//
//  AllHeroViewModel.h
//  BaseProject
//
//  Created by ios－07 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface AllHeroViewModel : BaseViewModel

@property(nonatomic,assign)NSInteger rowNumber;
@property(nonatomic,strong)NSString *desc;

- (NSString *)cnNameForRow:(NSInteger)row;
- (NSString *)locationForRow:(NSInteger)row;
- (NSString *)titleForrow:(NSInteger)row;

@end
