//
//  LLRedBus.m
//  DesignPattern
//
//  Created by lzy on 2020/1/14.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLRedBus.h"
#import "LLDriverWang.h"

@implementation LLRedBus
- (LLDriver *)needDriver {
    LLDriverWang *driver = [[LLDriverWang alloc] init];
    return driver;
}
@end
