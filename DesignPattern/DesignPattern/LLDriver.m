//
//  LLDriver.m
//  DesignPattern
//
//  Created by lzy on 2020/1/13.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLDriver.h"
#import "LLDriverLi.h"
#import "LLDriverWang.h"


@implementation LLDriver 
/// 开车
- (void)drive {
    self.num = 0;
    if (self.haveLicense) {
        NSLog(@"有驾照，编号：%ld，姓名是：%@",self.num,self.name);
    } else {
        NSLog(@"没驾照，不能开车");
    }
}


 

@end
