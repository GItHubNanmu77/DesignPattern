//
//  LLRoadLine.m
//  DesignPattern
//
//  Created by lzy on 2020/1/17.
//  Copyright © 2020 lzy. All rights reserved.
//

#import "LLRoadLine.h"
#import "LLStationHome.h"
#import "LLStationCompany.h"
#import "LLPickUpPeople.h"

@interface LLRoadLine ()

@property (nonatomic, strong) LLStationCompany *company;
@property (nonatomic, strong) LLPickUpPeople *pickUp;
@property (nonatomic, strong) LLStationHome *home;
@end

@implementation LLRoadLine

- (instancetype)init {
    self = [super init];
    if (self) {
        LLStationCompany *company = [[LLStationCompany alloc] init];
        self.company = company;
        LLPickUpPeople *pickUp = [[LLPickUpPeople alloc] init];
        self.pickUp = pickUp;
        LLStationHome *home = [[LLStationHome alloc] init];
        self.home = home;
        self.places = [NSString stringWithFormat:@"%@-%@-%@",company.place, pickUp.place, home.place];
        
    }
    return self;
}

- (void)doThings {
    [self.company startDrive];
    [self.pickUp pickUpPeople];
    [self.home arrived];
}
@end
