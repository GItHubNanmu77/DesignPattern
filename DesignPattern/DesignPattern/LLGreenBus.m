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
    LLDriverLi *movie = [[LLDriverLi alloc] init];
    return movie;
}

@end
