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

@required
// dataSource
// 有开车的人
- (void)needHaveLicensePeople:(id<LLDriveProtocol>)people;

////有座位
//- (void)haveSites;

// delegate
// 发动引擎
- (void)startEngin;


@optional

//// 有扶手
//- (void)haveHandrails;

// 开后备箱
- (void)openTrunk;

@end

NS_ASSUME_NONNULL_END
