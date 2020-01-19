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
#import "LLCar.h"
#import "LLPeopleZhang.h"
#import "LLStationHome.h"
#import "LLStationCompany.h"
#import "LLPickUpPeople.h"
#import "LLRoadLine.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) LLBus *bus;
@property (nonatomic, strong) LLDriver *workDriver;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:self.table];
    
    self.dataSource = @[@{@"title":@"单一职责原则--开车", @"function":@"startDrive"},
                        @{@"title":@"单一职责原则--换司机",@"function":@"changeBus"},
                        @{@"title":@"开放-封闭原则--简单工厂模式", @"function":@"setupEasyFactory"},
                        @{@"title":@"开放-封闭原则--工厂方法模式", @"function":@"setupNormalFactory"},
                        @{@"title":@"里式替换原则--举例", @"function":@"liShiReplace"},
                        @{@"title":@"里式替换原则--抽象工厂模式", @"function":@"setupAbstractFactory"},
                        @{@"title":@"依赖倒置原则--桥接模式", @"function":@"setupBridgeMode"},
                        @{@"title":@"迪米特法则--举例", @"function":@"setupLeastKnowledge"},
                        @{@"title":@"迪米特法则--外观模式", @"function":@"setupLeastKnowledgeImprove"},
                        @{@"title":@"接口隔离原则", @"function":@"setupInerface"}];
}

#pragma  mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
 

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    NSDictionary *data = self.dataSource[indexPath.row];
    cell.textLabel.text = data[@"title"];
    cell.detailTextLabel.text = data[@"function"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    if(!header){
        header = [[UIView alloc]init];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Footer"];
    if(!footer){
        footer = [[UIView alloc]init];
    }
    return footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.dataSource[indexPath.row];
    SEL selector = NSSelectorFromString(dic[@"function"]);
    if ([self respondsToSelector:selector]) {
        IMP imp = [self methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        func(self, selector);
    }
    
}

- (UITableView*)table{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _table.backgroundColor = [UIColor whiteColor];
        _table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _table.delegate = self;
        _table.dataSource = self;
        _table.rowHeight = 50;
    }
    return _table;
}

 

#pragma mark - 单一职责原则
// 简单工厂模式
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



#pragma mark - 开放-封闭原则
/// 工厂方法模式

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

#pragma mark - 里式替换原则
// 子类必须能够替换掉他们的父类，而不改变父类原有的功能
// 子类可以增加自己的特有方法
- (void)liShiReplace {
    LLBus *bus = [[LLBus alloc] init];
    LLGreenBus *greenBus = [[LLGreenBus alloc] init];
    [bus canDriveOnTheRoad];
    
    [greenBus haveBusNum];
    [greenBus canDriveOnTheRoad];
    [greenBus donotWannaDrive];
    
}

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
// 桥接模式
// 换车，不用管是什么车，只要实现了协议就可以用
// 换司机，不用管是什么人，只要有驾照就可以。只要实现了协议就可以用
// 分离开了车与司机的依赖，车和司机可以独立变化，拓展性好
// 实现了细节对客户透明
- (void)setupBridgeMode{
    
    id<LLBusProtocol> car = [[LLCar alloc] init];
    
    id<LLDriveProtocol> people = [[LLPeopleZhang alloc] init];
    
    [car needHaveLicensePeople:people];
}



#pragma mark - 迪米特原则（最少知识原则）
// 外观模式、中介者模式、代理模式 都是很好的遵守了这个原则

// 外观模式
// 客户端可能需要通过多个子系统来完成一件事，就比较麻烦，而且客户端不关心实现过程。就需要用到外观模式。
// 将多个子系统放到一个外观类上，客户端只接触外观类，不用管内部实现。
- (void)setupLeastKnowledge {
    
    LLBus *bus = [[LLGreenBus alloc] init];
    LLDriver *driver = [bus needDriver];
    [driver drive];
    [bus showDriverInfo:driver];
    
    LLStationCompany *company = [[LLStationCompany alloc] init];
    
    LLPickUpPeople *pickUp = [[LLPickUpPeople alloc] init];
    
    LLStationHome *home = [[LLStationHome alloc] init];
    
    [bus doSomeThing:company.place];
    [company startDrive];
    [bus doSomeThing:pickUp.place];
    [pickUp pickUpPeople];
    [bus doSomeThing:home.place];
    [home arrived];
}

- (void)setupLeastKnowledgeImprove {
    LLBus *bus = [[LLGreenBus alloc] init];
    LLDriver *driver = [bus needDriver];
    [driver drive];
    [bus showDriverInfo:driver];
    
    LLRoadLine *line = [[LLRoadLine alloc] init];
    [bus doSomeThing:line.places];
    [line doThings];
}

#pragma mark - 接口隔离原则
/**
 在设计接口时，尤其是在向现有的接口添加方法时，我们需要仔细斟酌这些方法是否是处理同一类任务的：如果是则可以放在一起；如果不是则需要做拆分。

 
UITableView的UITableViewDelegate和UITableViewDataSource这两个协议大家应该非常熟悉。这两个协议里的方法都是与UITableView相关的，但iOS SDK的设计者却把这些方法放在不同的两个协议中。UITableView协议的设计者很好地实践了接口分离的原则。原因就是这两个协议所包含的方法所处理的任务是不同的两种：

 UITableViewDelegate：含有的方法是UITableView的实例告知其代理一些点击事件的方法，即事件的传递，方向是从UITableView的实例到其代理。

 UITableViewDataSource：含有的方法是UITableView的代理传给UITableView一些必要数据供UITableView展示出来，即数据的传递，方向是从UITableView的代理到UITableView。
 */
- (void)setupInerface {
    
    LLCar *car = [[LLCar alloc] init];
    id<LLDriveProtocol> people = [[LLPeopleZhang alloc] init];
    [car haveSites];
    [car needHaveLicensePeople:people];
    [car startEngin];
}


@end
