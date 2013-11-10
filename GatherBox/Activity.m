//
//  Activity.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "Activity.h"
#import "AFNetworking/AFNetworking.h"
#import "AFAppDotNetAPIClient.h"
#import "Config.h"

@implementation Activity

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    //self.type = [[attributes valueForKeyPath:@"activity_type"] integerValue];
    self.name = [attributes valueForKeyPath:@"name"];
    self.guid = [attributes valueForKeyPath:@"guid"];
    self.creator = [attributes valueForKeyPath:@"creator"];
    
    return self;
}

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"/api/activities.json?type=current" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"data"];
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (NSDictionary *attributes in postsFromResponse) {
            
            Activity *post = [[Activity alloc] initWithAttributes:attributes];
            
            [mutablePosts addObject:post];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
