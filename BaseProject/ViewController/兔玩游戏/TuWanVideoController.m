//
//  TuWanVideoController.m
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanVideoController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TuWanVideoController ()

@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)AVPlayerLayer *layer;
@end

@implementation TuWanVideoController

- (instancetype)initWithURL:(NSURL *)url
{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  /*  self.player = [[AVPlayer alloc]initWithURL:_url];
    self.layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    [self.view.layer addSublayer:self.layer];
    self.layer.frame = CGRectMake(0, 150, 300, 250);
    [self.player play];
   */

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
