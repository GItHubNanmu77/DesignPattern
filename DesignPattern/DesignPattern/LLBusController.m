//
//  LLBusController.m
//  DesignPattern
//
//  Created by lzy on 2020/1/15.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLBusController.h"
#import "LLGreenBus.h"
#import "LLRedBus.h"

@implementation LLBusController

- (LLBus *)sendBus {
    LLBus *bus = [[LLGreenBus alloc] init];
    return bus;
}

- (LLBus *)sendBusString {
    LLBus *bus = [[NSClassFromString(@"LLGreenBus") alloc] init];
    return bus;
}


- (LLBus *)sendBusNum:(NSInteger)busNum {
    LLBus *bus;
    switch (busNum) {
        case 1:
            bus = [[LLGreenBus alloc] init];
            break;
        case 2:
            bus = [[LLRedBus alloc] init];
            break;
            
        default:
            bus = [[LLBus alloc] init];
            break;
    }
    return bus;
}
@end
