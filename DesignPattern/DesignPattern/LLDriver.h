//
//  LLDriver.h
//  DesignPattern
//
//  Created by lzy on 2020/1/13.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLDriver : NSObject
///编号
@property (nonatomic, assign) NSInteger num;
/// 姓名
@property (nonatomic, copy) NSString *name;
/// 开车
- (void)work;

@end

NS_ASSUME_NONNULL_END
