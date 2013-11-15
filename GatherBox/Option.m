//
//  Option.m
//  GatherBox
//
//  Created by Kaven Feng on 11/15/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "Option.h"

@implementation Option

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.oid = [attributes valueForKeyPath:@"oid"];
    //self.time = [attributes valueForKeyPath:@"name"];
    return self;
}


@end
