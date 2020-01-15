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
#import "LLBusController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btnStart;
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
    [self.view addSubview:self.btnStart];
    [self.view addSubview:self.btnChange];
}

#pragma mark - 简单工厂模式
- (void)startDrive {
    //初始化公交车
    LLBus *bus = [[LLBus alloc] init];
    self.bus = bus;
    
    //初始化司机
    LLDriver *driver = [self.bus needDriverNum:1];
    self.workDriver = driver;
    
    //司机开车
    [self.workDriver drive];
    
    //显示司机信息
    [self.bus showDriverInfo:self.workDriver];
    
}

// 换司机
- (void)changeBus {
    
    self.workDriver = [self.bus needDriverNum:2];
    
    [self.workDriver drive];
    
    [self.bus showDriverInfo:self.workDriver];
}

- (UIButton*)btnStart{
    if(!_btnStart){
        _btnStart = [[UIButton alloc]initWithFrame:CGRectMake(150, 100, 90, 30)];
        [_btnStart setTitle:@"开车" forState:UIControlStateNormal];
        [_btnStart setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btnStart.backgroundColor = [UIColor whiteColor];
        _btnStart.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnStart addTarget:self action:@selector(startDrive) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnStart;
}
- (UIButton*)btnChange{
    if(!_btnChange){
        _btnChange = [[UIButton alloc]initWithFrame:CGRectMake(150, 150, 90, 30)];
        [_btnChange setTitle:@"换司机" forState:UIControlStateNormal];
        [_btnChange setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btnChange.backgroundColor = [UIColor whiteColor];
        _btnChange.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnChange addTarget:self action:@selector(changeBus) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnChange;
}

#pragma mark - 工厂方法模式

// 简单工厂
// 换车，就需要修改bus内部的所有判断逻辑，复制给新的bus。客户知道。
// 换司机，直接修改司机编号，但是司机编号暴露在外，客户知道换了。
// 增加司机，就需要在bus里增加判断。
// 不符合开发-封闭原则
- (void)setupEasyFactory {
    LLBus *bus1 = [[LLBus alloc] init];
    LLDriver *driver1 = [bus1 needDriverNum:1];
    [driver1 drive];
    [bus1 showDriverInfo:driver1];
    
    LLBus *bus2 = [[LLBus alloc] init];
    LLDriver *driver2 = [bus2 needDriverNum:2];
    [driver2 drive];
    [bus2 showDriverInfo:driver2];
}

// 工厂模式
// 换车，只需要把车换掉，司机也跟随变化，改变少。客户知道。
// 换司机，在车的内部修改司机。客户不知道。
// 增加司机，就需要增加司机，还要增加车。
// 代码增多，符合开发-封闭原则
- (void)setupNormalFactory{
    LLBus *bus = [[LLGreenBus alloc] init];
    LLDriver *driver = [bus needDriver];
    [driver drive];
    [bus showDriverInfo:driver];
}

#pragma mark - 抽象工厂模式
// 抽象工厂
// 换车，在控制中心内部换，客户不知道。
// 换司机，在车的内部修改司机。客户不知道。
// 增加司机，就需要增加司机，还要增加车，还需要在控制中心修改。
// 代码增多，不符合开发-封闭原则
- (void)setupAbstractFactory {
    LLBusController *controller = [[LLBusController alloc] init];
    LLBus *bus = [controller sendBus];
    // 利用反射改进
//    LLBus *bus = [controller sendBusString];
    LLDriver *driver = [bus needDriver];
    [driver drive];
    [bus showDriverInfo:driver];
}

// 简单工厂改进抽象工厂
- (void)setupEasyAbstractFactory {
    LLBusController *controller = [[LLBusController alloc] init];
    LLBus *bus = [controller sendBusNum:1];
    LLDriver *driver = [bus needDriver];
    [driver drive];
    [bus showDriverInfo:driver];
}

#pragma mark - 依赖倒置原则
- (void)setupBridgeMode{
//    
//    id<LLBusProtocol> bus = [[LLBus alloc] init];
//    [bus.driveProtocol drive];
}
#pragma mark - 里式替换原则

#pragma mark - 迪米特原则

#pragma mark - 接口隔离原则



@end
