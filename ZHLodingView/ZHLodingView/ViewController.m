//
//  ViewController.m
//  ZHLodingView
//
//  Created by 性用社 on 16/10/18.
//  Copyright © 2016年 性用社. All rights reserved.
//

#import "ViewController.h"
#import "ZHLodingStatusView.h"
@interface ViewController ()

/** lodingView */
@property (nonatomic,strong)ZHLodingStatusView *statusView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initLoadingViews];
    [self performSelector:@selector(Done) withObject:self afterDelay:3];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initLoadingViews {
    _statusView = [[ZHLodingStatusView alloc] initWithFrame:self.view.frame];
    __weak ViewController *weakSelf = self;
    __weak ZHLodingStatusView *weakStatusView = _statusView;
    _statusView.refresh = ^() {
        [weakStatusView Loding];
       [weakSelf performSelector:@selector(Done) withObject:weakSelf afterDelay:3];
      };
    [self.view addSubview:_statusView];
    [_statusView Loding];
}
- (void)Done{
    [_statusView NetErr];
}
@end
