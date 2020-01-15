//
//  LLBusProtocol.h
//  DesignPattern
//
//  Created by lzy on 2020/1/15.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLDriveProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LLBusProtocol <NSObject>

@property (nonatomic, assign) id<LLDriveProtocol> driveProtocol;

// 有20个座位
- (void)haveTwentySites;

@end

NS_ASSUME_NONNULL_END
