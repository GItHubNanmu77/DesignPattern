//
//  LLStationHome.h
//  DesignPattern
//
//  Created by lzy on 2020/1/17.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLStationHome : NSObject

@property (nonatomic, copy) NSString *place;

- (void)arrived;

@end

NS_ASSUME_NONNULL_END
