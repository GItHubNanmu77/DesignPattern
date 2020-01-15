//
//  LLBusController.h
//  DesignPattern
//
//  Created by lzy on 2020/1/15.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LLBus.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLBusController : NSObject
// 抽象工厂
- (LLBus *)sendBus;
// 利用反射改进抽象工厂
- (LLBus *)sendBusString;

// 利用简单工厂改进抽象工厂
- (LLBus *)sendBusNum:(NSInteger)busNum;

@end

NS_ASSUME_NONNULL_END
