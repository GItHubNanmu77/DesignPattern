//
//  LLGreenBus.h
//  DesignPattern
//
//  Created by lzy on 2020/1/14.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLBus.h"
#import "LLDriver.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLGreenBus : LLBus
//子类特有的方法，不想上路
- (void)donotWannaDrive;
@end

NS_ASSUME_NONNULL_END
