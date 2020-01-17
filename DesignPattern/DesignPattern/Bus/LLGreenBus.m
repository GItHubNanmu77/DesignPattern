//
//  LLGreenBus.m
//  DesignPattern
//
//  Created by lzy on 2020/1/14.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLGreenBus.h"
#import "LLDriverLi.h"

@implementation LLGreenBus
- (LLDriver *)needDriver {
    LLDriverLi *driver = [[LLDriverLi alloc] init];
    return driver;
}

//重写父类的抽象方法
- (void)haveBusNum {
    self.isAllocAbstract = YES;
    self.busNum = 1;
}

/// 定义：子类可以替换父类
// 重写了父类实现方法，影响了父类原有功能
//- (void)canDriveOnTheRoad {
//    if (self.isAllocAbstract) {
//        NSLog(@"\n实例方法：车牌号：%ld，能上路",self.busNum);
//    } else {
//        NSLog(@"\n实例方法：未实现抽象类，没牌照，不能上路");
//    }
//    NSLog(@"\n实例方法：不想上路");
//}
 

- (void)donotWannaDrive {
    
    [self canDriveOnTheRoad];
    
    NSLog(@"\n实例方法：不想上路");
}

 

 

@end
