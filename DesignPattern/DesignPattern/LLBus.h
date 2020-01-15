//
//  LLBus.h
//  DesignPattern
//
//  Created by lzy on 2020/1/13.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLDriver.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLBus : NSObject

- (LLDriver *)needDriverNum:(NSInteger)num;

- (void)playChannel:(LLDriver *)driver;

- (LLDriver *)needDriver;
@end

NS_ASSUME_NONNULL_END
