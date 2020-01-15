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
/// 内容
@property (nonatomic, copy) NSString *content;
/// 设置内容
- (void)work;

@end

NS_ASSUME_NONNULL_END
