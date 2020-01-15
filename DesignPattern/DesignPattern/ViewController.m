//
//  ViewController.m
//  DesignPattern
//
//  Created by lzy on 2020/1/8.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "ViewController.h"

#import "LLDriver.h"
#import "LLDriverLi.h"
#import "LLDriverWang.h"
#import "LLBus.h"
#import "LLGreenBus.h"
#import "LLRedBus.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btnWatch;
@property (nonatomic, strong) UIButton *btnChange;
@property (nonatomic, strong) LLBus *bus;
@property (nonatomic, strong) LLDriver *workDriver;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
//    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
//    nameLabel.text = @"用户";
//    nameLabel.font = [UIFont boldSystemFontOfSize:22];
//    [self.view addSubview:nameLabel];
//
//
    [self.view addSubview:self.btnWatch];
    [self.view addSubview:self.btnChange];
}

#pragma mark - 简单工厂模式
- (void)startDrive {
    //初始化电视
    LLBus *bus = [[LLBus alloc] init];
    self.bus = bus;
    
    //初始化频道
    LLDriver *driver = [self.bus needDriverNum:1];
    self.workDriver = driver;
    
    //频道内容设置
    [self.workDriver work];
    
    //播放频道内容
    [self.bus showDriverInfo:self.workDriver];
    
}

// 换司机
- (void)changeBus {
    
    self.workDriver = [self.bus needDriverNum:2];
    
    [self.workDriver work];
    
    [self.bus showDriverInfo:self.workDriver];
}

- (UIButton*)btnWatch{
    if(!_btnWatch){
        _btnWatch = [[UIButton alloc]initWithFrame:CGRectMake(150, 100, 90, 30)];
        [_btnWatch setTitle:@"开车" forState:UIControlStateNormal];
        [_btnWatch setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btnWatch.backgroundColor = [UIColor whiteColor];
        _btnWatch.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnWatch addTarget:self action:@selector(startDrive) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnWatch;
}
- (UIButton*)btnChange{
    if(!_btnChange){
        _btnChange = [[UIButton alloc]initWithFrame:CGRectMake(150, 150, 90, 30)];
        [_btnChange setTitle:@"换车" forState:UIControlStateNormal];
        [_btnChange setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btnChange.backgroundColor = [UIColor whiteColor];
        _btnChange.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnChange addTarget:self action:@selector(changeBus) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnChange;
}

#pragma mark - 工厂方法模式

// 简单工厂，换车
- (void)setupEasyTelevisionWall {
    LLBus *bus1 = [[LLBus alloc] init];
    LLDriver *driver1 = [bus1 needDriverNum:1];
    [driver1 work];
    [bus1 showDriverInfo:driver1];
    
    LLBus *bus2 = [[LLBus alloc] init];
    LLDriver *driver2 = [bus2 needDriverNum:2];
    [driver2 work];
    [bus2 showDriverInfo:driver2];
}

//工厂模式，换车
- (void)setupNormalTelevisonWall{
    LLBus *bus   = [[LLGreenBus alloc] init];
    LLDriver *driver = [bus needDriver];
    [driver work];
    [bus showDriverInfo:driver];
}

@end
