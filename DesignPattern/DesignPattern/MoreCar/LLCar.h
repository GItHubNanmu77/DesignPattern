//
//  LLCar.h
//  DesignPattern
//
//  Created by lzy on 2020/1/15.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLBusProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLCar : NSObject <LLBusProtocol>
 
- (void)goSomeWhere:(NSString *)place;
@end

NS_ASSUME_NONNULL_END
