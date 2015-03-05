//
//  ShareView.h
//  umengShareDemo
//
//  Created by jamalping on 15-3-5.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ShareAction)(UIButton *button);

typedef enum : NSUInteger {
    shareSinaWeibo,
    shareTencentWeibo,
    shareQQfriend,
    shareQzone,
    shareWchart,
    shareWfriend,
} shareType;

@interface ShareView : UIView
{
    CGRect _frame;
    UIView *_markView;
    UIWindow *keyWind; //当前窗口
    ShareAction _shareAction;
}

/**
 *  @brief  初始化方法
 *
 *  @param frame       分享主体视图的frame
 *  @param shareAction 分享响应的block
 *
 *  @return shareView
 */
- (id)initWithFrame:(CGRect)frame shareAction:(ShareAction)shareAction;

/**
 *  @brief  出现分享视图
 */
- (void)show;

/**
 *  @brief  分享视图消失
 */
- (void)dismiss;

@end
