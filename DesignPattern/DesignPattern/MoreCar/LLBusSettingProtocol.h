//
//  LLBusSettingProtocol.h
//  DesignPattern
//
//  Created by lzy on 2020/1/19.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LLBusSettingProtocol <NSObject>
@required
//有座位
- (void)haveSites;

@optional
// 有扶手
- (void)haveHandrails;
@end

NS_ASSUME_NONNULL_END
