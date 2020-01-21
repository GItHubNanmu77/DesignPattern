//
//  LLBus.m
//  DesignPattern
//
//  Created by lzy on 2020/1/13.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLBus.h"
#import "LLDriverLi.h"
#import "LLDriverWang.h"

@interface LLBus ()


@end

@implementation LLBus

- (void)showDriverInfo:(LLDriver *)driver {
    NSLog(@"开车。。。。。司机编号：%ld，姓名是：%@",driver.num,driver.name);
}

- (LLDriver *)needOneDriver {
    LLDriver *driver = [[LLDriver alloc] init];
    driver.num = 0;
    driver.name = @"zhang";
    driver.haveLicense = YES;
    return driver;
}

- (LLDriver *)needAnotherDriver {
    LLDriver *driver = [[LLDriver alloc] init];
    driver.num = 22;
    driver.name = @"li";
    driver.haveLicense = YES;
    return driver;
}

- (LLDriver *)needDriverNum:(NSInteger)num {
    LLDriver *driver;
    switch (num) {
        case 1: {
            driver = [[LLDriverLi alloc] init];
        }
        break;
            
        case 2: {
            driver = [[LLDriverWang alloc] init];
        }
        break;
            
        default:{
            driver = [[LLDriver alloc] init];
        }
            break;
    }
    
    return driver;
}


- (LLDriver *)needDriver {
    LLDriver *driver  = [[LLDriver alloc] init];
    return driver;
}
 
- (void)haveBusNum {
    if (!self.isAllocAbstract) {
        NSLog(@"\n%s这是一个抽象类，需要先实例化车",__func__);
        NSAssert(NO, @"\n{%@} 这个类是抽象基类，需要先实例化车", NSStringFromClass([self class]));
    }
}

- (void)canDriveOnTheRoad {
    if (self.isAllocAbstract && self.busNum > 0) {
        NSLog(@"\n实例方法：车牌号：%ld，能上路",self.busNum);
    } else {
        NSLog(@"\n实例方法：未实现抽象类，没牌照，不能上路");
    }
}

- (void)doSomeThing:(NSString *)thing {
    NSLog(@"开车%@",thing);
}
 
@end
