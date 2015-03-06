//
//  ViewController.m
//  umengShareDemo
//
//  Created by jamalping on 15-3-3.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    ShareView *shareView;
}

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
    
    shareView = [[ShareView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300) shareAction:^(UIButton *button) {
        [shareView dismiss];
        switch (button.tag) {
            case shareSinaWeibo:{
                // 判断是否授权
                if ([UMSocialAccountManager isOauthAndTokenNotExpired:UMShareToSina]) { // 授权了，直接分享
                    NSLog(@"sina weibo share");
                    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self, [UMSocialControllerService defaultControllerService], YES);
                }else { // 未授权，进行授权
                    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].loginClickHandler(self, [UMSocialControllerService defaultControllerService], YES, ^(UMSocialResponseEntity *response){
                        if (response.responseCode == UMSResponseCodeSuccess) {
                            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
                            NSLog(@"username is %@, uid is %@, token is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken);
                        }
                    });
                }
            }break;
            case shareTencentWeibo:{
                if ([UMSocialAccountManager isOauthAndTokenNotExpired:UMShareToTencent]) {
                    NSLog(@"tencent weibo share");
                    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToTencent].snsClickHandler(self, [UMSocialControllerService defaultControllerService], YES);
                }else{
                    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToTencent].loginClickHandler(self, [UMSocialControllerService defaultControllerService], YES, ^(UMSocialResponseEntity *response){
                        if (response.responseCode == UMSResponseCodeSuccess) {
                            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToTencent];
                            NSLog(@"username is %@, uid is %@, token is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken);
                        }
                    });
                }
            }break;
            case shareQzone:{
                if ([UMSocialAccountManager isOauthAndTokenNotExpired:UMShareToQzone]) {
                    NSLog(@"shareQzoneshare");
                    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToTencent].snsClickHandler(self, [UMSocialControllerService defaultControllerService], YES);
                }else {
                    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQzone].loginClickHandler(self, [UMSocialControllerService defaultControllerService], YES, ^(UMSocialResponseEntity *response){
                        if (response.responseCode == UMSResponseCodeSuccess) {
                            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQzone];
                            NSLog(@"username is %@, uid is %@, token is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken);
                        }
                    });
                }
            }break;
            case shareQQfriend:{
                if ([UMSocialAccountManager isOauthAndTokenNotExpired:UMShareToQQ]) {
                    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[UMShareToQQ] content:@"QQ空间的分享" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response) {
                        if (response.responseCode == UMSResponseCodeSuccess) {
                            NSLog(@"shareQQfriendshare");
                            NSLog(@"分享成功！");
                        }
                    }];
                }else {
                    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ].loginClickHandler(self, [UMSocialControllerService defaultControllerService], YES, ^(UMSocialResponseEntity *response){
                        if (response.responseCode == UMSResponseCodeSuccess) {
                            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
                            NSLog(@"username is %@, uid is %@, token is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken);
                        }
                    });
                }
            }break;
            case shareWchart:{
                if ([UMSocialAccountManager isOauthAndTokenNotExpired:UMShareToWechatTimeline]) {
//                    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[UMShareToQQ] content:@"QQ空间的分享" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response) {
//                        if (response.responseCode == UMSResponseCodeSuccess) {
//                            NSLog(@"shareQQfriendshare");
//                            NSLog(@"分享成功！");
//                        }
//                    }];
                    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[UMShareToWechatTimeline] content:@"微信朋友圈分享" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response) {
                        if (response.responseCode == UMSResponseCodeSuccess) {
                            NSLog(@"shareWchartshare");
                            NSLog(@"微信朋友圈分享成功！");
                        }
                    }];
                }else {
//                    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatTimeline].loginClickHandler(self, [UMSocialControllerService defaultControllerService], YES, ^(UMSocialResponseEntity *response){
//                        if (response.responseCode == UMSResponseCodeSuccess) {
//                            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToWechatTimeline];
//                            NSLog(@"username is %@, uid is %@, token is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken);
//                        }
//                    });
                }
            }break;
            case shareWfriend:{
                NSLog(@"Wfriend share");
                [[UMSocialDataService defaultDataService] postSNSWithTypes:@[UMShareToWechatSession] content:@"微信好友分享" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response) {
                    if (response.responseCode == UMSResponseCodeSuccess) {
                        NSLog(@"shareWchartshare");
                        NSLog(@"微信朋友圈分享成功！");
                    }
                }];
            }break;
            default:
                break;
        }
    }];
    
//    [UMSocialSnsService presentSnsController:self
//                                      appKey:UmengAppKey
//                                   shareText:@"分享文字"
//                                  shareImage:nil
//                             shareToSnsNames:@[UMShareToSina,UMShareToTencent,UMShareToWechatTimeline]
//                                    delegate:self];
}

- (void)shareButton {
    [shareView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
