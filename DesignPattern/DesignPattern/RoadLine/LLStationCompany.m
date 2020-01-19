//
//  LLStationCompany.m
//  DesignPattern
//
//  Created by lzy on 2020/1/17.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLStationCompany.h"

@implementation LLStationCompany

- (instancetype)init {
    self = [super init];
    if (self) {
        self.place = @"去公司";
    }
    return self;
}
- (void)startDrive {
    NSLog(@"从公司出发了");
}

@end
