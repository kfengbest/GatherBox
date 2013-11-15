//
//  Option.m
//  GatherBox
//
//  Created by Kaven Feng on 11/15/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "Option.h"
#import "Utils.h"

@implementation Option

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.oid = [[attributes valueForKeyPath:@"id"] valueForKeyPath:@"$oid"];
    self.time = [Utils dateFromString:[attributes valueForKeyPath:@"option"]];
    
    return self;
}


@end
