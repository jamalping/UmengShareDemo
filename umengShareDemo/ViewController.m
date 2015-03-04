//
//  ViewController.m
//  umengShareDemo
//
//  Created by jamalping on 15-3-3.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"分享";
    
    UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 21, 20)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"shareButton@2x"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *share = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    self.navigationItem.rightBarButtonItem = share;
    
    NSLog(@"%@",UmengAppKey);
    
//    [UMSocialSnsService presentSnsController:self
//                                      appKey:UmengAppKey
//                                   shareText:@"分享文字"
//                                  shareImage:nil
//                             shareToSnsNames:@[UMShareToSina,UMShareToTencent,UMShareToWechatTimeline]
//                                    delegate:self];
}

- (void)shareButton {
    [UIView animateWithDuration:0.35 animations:^{
        _markView.alpha = 1;
        _shareBottomView.frame = CGRectMake(0, kScreenHeight -300, 320, 300 );
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
