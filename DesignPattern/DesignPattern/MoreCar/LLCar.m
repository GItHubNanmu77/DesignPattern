//
//  LLCar.m
//  DesignPattern
//
//  Created by lzy on 2020/1/15.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLCar.h"

@implementation LLCar

- (void)needHaveLicensePeople:(id<LLDriveProtocol>)people {
    [people haveLicense];
}
 

- (void)haveSites {
    NSLog(@"我有4个座位");
}


- (void)startEngin {
    NSLog(@"发动引擎");
}


@end
