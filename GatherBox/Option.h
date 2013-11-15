//
//  Option.h
//  GatherBox
//
//  Created by Kaven Feng on 11/15/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Option : NSObject

@property (nonatomic, strong) NSString* oid;
@property (nonatomic, strong) NSDate* time;
@property (nonatomic, strong) NSArray* votedUsers;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
