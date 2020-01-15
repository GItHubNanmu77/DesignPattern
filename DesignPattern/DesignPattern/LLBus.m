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

@implementation LLBus

- (void)showDriverInfo:(LLDriver *)driver {
    NSLog(@"开车。。。。。司机编号：%ld，姓名是：%@",driver.num,driver.name);
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
 

@end
