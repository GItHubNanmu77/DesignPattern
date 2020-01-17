//
//  LLBus.h
//  DesignPattern
//
//  Created by lzy on 2020/1/13.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLDriver.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLBus : NSObject
/// 车牌号
@property (nonatomic, assign) NSInteger busNum;
/// 座位
@property (nonatomic, assign) NSInteger sitesCount;

- (void)showDriverInfo:(LLDriver *)driver;
///简单工厂
- (LLDriver *)needDriverNum:(NSInteger)num;
///工厂方法
- (LLDriver *)needDriver;

///里式替换
/// 是否实现抽象方法
@property (nonatomic, assign) BOOL isAllocAbstract;
//抽象方法，是否有牌照
- (void)haveBusNum;
//实现方法，判断是否能上路
- (void)canDriveOnTheRoad;

// 迪米特
- (void)doSomeThing:(NSString *)thing;
@end

NS_ASSUME_NONNULL_END
