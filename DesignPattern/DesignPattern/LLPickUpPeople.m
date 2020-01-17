//
//  LLPickUpPeople.m
//  DesignPattern
//
//  Created by lzy on 2020/1/17.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLPickUpPeople.h"

@implementation LLPickUpPeople
- (instancetype)init {
    self = [super init];
    if (self) {
        self.place = @"去接人";
    }
    return self;
}

- (void)pickUpPeople {
    NSLog(@"接到人了");
}
@end
