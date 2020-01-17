//
//  LLStationHome.m
//  DesignPattern
//
//  Created by lzy on 2020/1/17.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLStationHome.h"

@implementation LLStationHome

- (instancetype)init {
    self = [super init];
    if (self) {
        self.place = @"去家里";
    }
    return self;
}

- (void)arrived {
    NSLog(@"到家了");
}
@end
