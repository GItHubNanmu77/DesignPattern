//
//  LLSpecialBus.h
//  DesignPattern
//
//  Created by lzy on 2020/1/17.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLBus.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLSpecialBus : LLBus
///是警车
- (void)isPoliceBus;

@end

NS_ASSUME_NONNULL_END
