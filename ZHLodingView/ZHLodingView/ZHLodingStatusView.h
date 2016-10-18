//
//  ZHLodingStatusView.h
//  SayU
//
//  Created by 性用社 on 16/10/12.
//  Copyright © 2016年 xys. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, LoadingStatus) {
    Loading,//加载中
    NetErr,//网络出错
    Done,//加载结束
    Empty,//空数据
};
@interface ZHLodingStatusView : UIView

/**
 *  根据列表当前的状态显示不同的内容
 *
 *  
 */
- (void) showWithStatus : (LoadingStatus) status;
/**<完成>*/
- (void)Done;
/**<加载>*/
-(void)Loding;
/**<网络错误>*/
- (void)NetErr;
/**<空数据>*/
- (void)Empty;

@property (nonatomic,copy) void (^refresh)(void);
/**
 *  设置内容为空的图片和文字提示
 *
 *  @param imageName    图片名字
 *  @param strText 文字提示
 *  @param buttonTitle 点击按钮的文字提示
 */
- (void)setEmptyNetErrViewWithiconImage:(NSString *)imageName description:(NSString *)strText isHideBtn:(BOOL)isHideBtn buttonTitle:(NSString *)buttonTitle;

@end
