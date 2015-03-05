//
//  ShareView.m
//  umengShareDemo
//
//  Created by jamalping on 15-3-5.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

- (void)dealloc
{
    NSLog(@"shareView dead!!");
}

- (id)initWithFrame:(CGRect)frame shareAction:(ShareAction)shareAction {
    self = [super initWithFrame:frame];
    if (self) {
        _frame = frame;
        _shareAction = shareAction;
        [self _initSubView];
    }
    return self;
}

// 初始化子视图
- (void)_initSubView {
    // 获取到当前窗口
    keyWind = [UIApplication sharedApplication].keyWindow;
    if(!keyWind){
        keyWind = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    _markView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _markView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
    _markView.alpha = 0;
    
    [_markView addSubview:self];
//    self.frame.origin.y = _markView.frame.size.height - self.frame.size.height;
    self.frame = CGRectMake(self.frame.origin.x, _markView.frame.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [_markView addGestureRecognizer:tap];
    
    [self _initSharebutton];
}

- (void)_initSharebutton
{
    UILabel *shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, 100, 30)];
    shareLabel.text = @"分享到";
    shareLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:shareLabel];
    
    UIImageView *grayLine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 34, 310, 1)];
    grayLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:grayLine];
    
    //************************************************************************************
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 35, 320/3, 320/3)];
    btn1.tag = shareSinaWeibo;
    btn1.backgroundColor = [UIColor greenColor];
    [btn1 setTitle:@"新浪微博" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(320/3, 35, 320/3, 320/3)];
    btn2.tag = shareTencentWeibo;
    btn2.backgroundColor = [UIColor magentaColor];
    [btn2 setTitle:@"腾讯微博" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self                                                                                                                     action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(320/3*2, 35, 320/3, 320/3)];
    btn3.backgroundColor = [UIColor cyanColor];
    btn3.tag = shareQQfriend;
    [btn3 setTitle:@"QQ好友" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 35+320/3, 320/3, 320/3)];
    btn4.tag = shareWchart;
    btn4.backgroundColor = [UIColor orangeColor];
    [btn4 setTitle:@"朋友圈" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(320/3, 35+320/3, 320/3, 320/3)];
    btn5.tag = shareQzone;
    btn5.backgroundColor = [UIColor yellowColor];
    [btn5 setTitle:@"QQ空间" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc] initWithFrame:CGRectMake(320/3*2, 35+320/3, 320/3, 320/3)];
    btn6.tag = shareWfriend;
    btn6.backgroundColor = [UIColor blueColor];
    [btn6 setTitle:@"微信好友" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn6];
    
    //************************************************************************************
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 260, 120, 30)];
    cancelBtn.backgroundColor = [UIColor redColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
}

- (void)show {
    [UIView animateWithDuration:0.35 animations:^{
        _markView.alpha = 1;
    } completion:^(BOOL finished) {
        [keyWind addSubview:_markView];
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.35 animations:^{
        _markView.alpha = 0;
    } completion:^(BOOL finished) {
        [_markView removeFromSuperview];
    }];
}

//
- (void)buttonClick:(UIButton *)button {
    if (_shareAction) {
        _shareAction(button);
    }
}

@end
