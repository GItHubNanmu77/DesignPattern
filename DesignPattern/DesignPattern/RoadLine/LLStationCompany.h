//
//  LLStationCompany.h
//  DesignPattern
//
//  Created by lzy on 2020/1/17.
//  Copyright © 2020 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLStationCompany : NSObject

@property (nonatomic, copy) NSString *place;

- (void)startDrive;

@end

NS_ASSUME_NONNULL_END
