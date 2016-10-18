//
//  ZHLodingStatusView.m
//  SayU
//
//  Created by 性用社 on 16/10/12.
//  Copyright © 2016年 xys. All rights reserved.
//

#import "ZHLodingStatusView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//次要字体、按钮颜色
#define COLOR_3 [UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1]
//背景色
#define COLOR_23 [UIColor colorWithRed:245/255.0 green:245/255.0 blue:247/255.0 alpha:1.0]
@interface ZHLodingStatusView()
{
    UIButton *failsButton; //加载失败按钮
    UIImageView *lodingImageView; //加载中的视图动画
    UIView *emptyNetErrView;
    UIImageView *iconImage;
    UILabel    *descriptionLab;
    UIButton *rechangeBtn;
}
@end

@implementation ZHLodingStatusView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        //正常的加载视图动画
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
                                 [UIImage imageNamed:@"dynamic_-effect1"],
                                 [UIImage imageNamed:@"dynamic_-effect2"],
                                 [UIImage imageNamed:@"dynamic_-effect3"],
                                 [UIImage imageNamed:@"dynamic_-effect4"],
                                 [UIImage imageNamed:@"dynamic_-effect5"],
                                 [UIImage imageNamed:@"dynamic_-effect6"],
                                 [UIImage imageNamed:@"dynamic_-effect7"],
                                 [UIImage imageNamed:@"dynamic_-effect8"],
                                 [UIImage imageNamed:@"dynamic_-effect9"],
                                 [UIImage imageNamed:@"dynamic_-effect10"],
                                 [UIImage imageNamed:@"dynamic_-effect11"],
                                 [UIImage imageNamed:@"dynamic_-effect12"],
                                 [UIImage imageNamed:@"dynamic_-effect13"],
                                 [UIImage imageNamed:@"dynamic_-effect14"],
                                 [UIImage imageNamed:@"dynamic_-effect15"],
                                 [UIImage imageNamed:@"dynamic_-effect16"],
                                 [UIImage imageNamed:@"dynamic_-effect17"],
                                 [UIImage imageNamed:@"dynamic_-effect18"],
                                 [UIImage imageNamed:@"dynamic_-effect19"],
                                 [UIImage imageNamed:@"dynamic_-effect20"],
                                 [UIImage imageNamed:@"dynamic_-effect21"],
                                 [UIImage imageNamed:@"dynamic_-effect22"],
                                 [UIImage imageNamed:@"dynamic_-effect23"],
                                 [UIImage imageNamed:@"dynamic_-effect24"],
                                 [UIImage imageNamed:@"dynamic_-effect25"],
                                 [UIImage imageNamed:@"dynamic_-effect26"],
                                 [UIImage imageNamed:@"dynamic_-effect27"],
                                 [UIImage imageNamed:@"dynamic_-effect28"],
                                 [UIImage imageNamed:@"dynamic_-effect29"],
                                 [UIImage imageNamed:@"dynamic_-effect30"],nil];
        lodingImageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.frame) - SCREEN_WIDTH/375*140) / 2 ,(CGRectGetHeight(self.frame) - SCREEN_HEIGHT/667 *150)/2,SCREEN_WIDTH/375*140, SCREEN_HEIGHT/667 *150)];
        lodingImageView.animationImages = array; //动画图片数组
        lodingImageView.animationDuration = 2; //执行一次完整动画所需的时长
        lodingImageView.animationRepeatCount = 30;
        [lodingImageView startAnimating];
      
        
        //没网 或者没有数据的时候调用一下视图
        failsButton =[UIButton buttonWithType:UIButtonTypeCustom];
        failsButton.frame =CGRectMake((CGRectGetWidth(self.frame) - SCREEN_WIDTH/375*140) / 2 ,(CGRectGetHeight(self.frame) - SCREEN_HEIGHT/667 *150)/2,SCREEN_WIDTH/375*140, SCREEN_HEIGHT/667 *150);
        [failsButton setImage:[UIImage imageNamed:@"dynamic_fail"] forState:UIControlStateNormal];
        [failsButton addTarget:self action:@selector(failBtn) forControlEvents:UIControlEventTouchUpInside];
        
        emptyNetErrView = [[UIView alloc]init];
        emptyNetErrView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-114);
        emptyNetErrView.backgroundColor = COLOR_23;
        
        iconImage = [UIImageView new];
        iconImage.frame = CGRectMake(0, SCREEN_HEIGHT/667*75, SCREEN_WIDTH, SCREEN_HEIGHT/667*110);
        iconImage.contentMode = UIViewContentModeCenter;
        [emptyNetErrView addSubview:iconImage];
        
        descriptionLab = [UILabel new];
        descriptionLab.frame = CGRectMake(0, CGRectGetMaxY(iconImage.frame), SCREEN_WIDTH, SCREEN_HEIGHT/667*25);
        descriptionLab.textColor = COLOR_3;
        descriptionLab.font = [UIFont systemFontOfSize:SCREEN_HEIGHT/667*12];
        descriptionLab.textAlignment = NSTextAlignmentCenter;
        [emptyNetErrView addSubview:descriptionLab];
        
        rechangeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rechangeBtn.center = CGPointMake(self.center.x, CGRectGetMaxY(descriptionLab.frame) + SCREEN_HEIGHT/667*25);
        rechangeBtn.bounds = CGRectMake(0, 0, SCREEN_WIDTH/375*120, SCREEN_HEIGHT/667*40);
        rechangeBtn.titleLabel.font = [UIFont systemFontOfSize:SCREEN_HEIGHT/667*12];
        [rechangeBtn setTitleColor:COLOR_3 forState:UIControlStateNormal];
        rechangeBtn.userInteractionEnabled = YES;
        [rechangeBtn addTarget:self action:@selector(failBtn) forControlEvents:UIControlEventTouchUpInside];
        [emptyNetErrView addSubview:rechangeBtn];
    }
    
    return self;
}

- (void)Done{
    [self showWithStatus:Done];
}

- (void)Loding{
    [self showWithStatus:Loading];
}

- (void)NetErr{
    [self showWithStatus:NetErr];
}

- (void)Empty{
    [self showWithStatus:Empty];
}
- (void)showWithStatus:(LoadingStatus)status {
    
    [self removeSubviews];
    switch (status) {
            
        case Empty:
            [self addSubview:emptyNetErrView];
            break;
        case Loading:
            [self addSubview:lodingImageView];
            [lodingImageView startAnimating];
            break;
        case NetErr:
            [self addSubview:failsButton];
            break;
        case Done:
            [self removeFromSuperview];
            break;
       
        default:
            break;
    }
    
    [self.superview bringSubviewToFront:self];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    failsButton.frame = CGRectMake((CGRectGetWidth(self.frame) - SCREEN_WIDTH/375*140) / 2 ,(CGRectGetHeight(self.frame) - SCREEN_HEIGHT/667 *150)/2,SCREEN_WIDTH/375*140, SCREEN_HEIGHT/667 *150);
    lodingImageView.frame =CGRectMake((CGRectGetWidth(self.frame) - SCREEN_WIDTH/375*140) / 2 ,(CGRectGetHeight(self.frame) - SCREEN_HEIGHT/667 *150)/2,SCREEN_WIDTH/375*140, SCREEN_HEIGHT/667 *150);
    emptyNetErrView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-114);
    iconImage.frame = CGRectMake(0, SCREEN_HEIGHT/667*75, SCREEN_WIDTH, SCREEN_HEIGHT/667*110);
    descriptionLab.frame = CGRectMake(0, CGRectGetMaxY(iconImage.frame), SCREEN_WIDTH, SCREEN_HEIGHT/667*25);
    rechangeBtn.center = CGPointMake(self.center.x, CGRectGetMaxY(descriptionLab.frame) + SCREEN_HEIGHT/667*25);
    rechangeBtn.bounds = CGRectMake(0, 0, SCREEN_WIDTH/375*120, SCREEN_HEIGHT/667*40);
}

- (void)removeSubviews {
    
    for(UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}
- (void)failBtn{
    self.refresh();
}
- (BOOL) isLoadingStatus {
    NSArray *subviews = [self subviews];
    if(subviews && subviews.count > 0) {
        BOOL isEmptyStatus = NO;
        for(UIView *subView in subviews) {
            if(lodingImageView == subView) {
                isEmptyStatus = YES;
            }
        }
        return isEmptyStatus;
    }
    return NO;
}

- (void)setEmptyNetErrViewWithiconImage:(NSString *)imageName description:(NSString *)strText isHideBtn:(BOOL)isHideBtn buttonTitle:(NSString *)buttonTitle
{
    
    iconImage.image = [UIImage imageNamed:imageName];
    descriptionLab.text = strText;
    rechangeBtn.hidden = isHideBtn;
    [rechangeBtn setTitle:buttonTitle forState:UIControlStateNormal];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


@end
