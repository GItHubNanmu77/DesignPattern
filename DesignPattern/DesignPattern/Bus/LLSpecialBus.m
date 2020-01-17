//
//  LLSpecialBus.m
//  DesignPattern
//
//  Created by lzy on 2020/1/17.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLSpecialBus.h"

@implementation LLSpecialBus

//重写父类的抽象方法
- (void)haveBusNum {
//    self.isAllocAbstract = YES;
//    self.busNum = 1;
}



- (void)isPoliceBus {
    NSLog(@"\n实例方法：我是警车，没牌照，要直接上路");
}


@end
