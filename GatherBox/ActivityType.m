//
//  ActivityType.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "ActivityType.h"
#import "AFNetworking/AFNetworking.h"
#import "AFAppDotNetAPIClient.h"
#import "Config.h"

@implementation ActivityType

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.type = [[attributes valueForKeyPath:@"type"] integerValue];
    self.name = [attributes valueForKeyPath:@"name"];
    
    return self;
}



@end
