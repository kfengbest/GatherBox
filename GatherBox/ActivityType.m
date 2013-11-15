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

static NSMutableDictionary* s_activityTypes = nil;

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.type = [[attributes valueForKeyPath:@"type"] integerValue];
    self.name = [attributes valueForKeyPath:@"name"];
    self.imageUrl = [NSString stringWithFormat:@"type%d.png",self.type];
    
    return self;
}

+ (NSMutableDictionary*) allTypes
{
    if (!s_activityTypes) {
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://collect.im/api/activities/types.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSArray *postsFromResponse = [responseObject valueForKeyPath:@"data"];
            s_activityTypes = [[NSMutableDictionary alloc] init];
            
            for (NSDictionary *attributes in postsFromResponse) {
                
                ActivityType *post = [[ActivityType alloc] initWithAttributes:attributes];
                NSString* typeId = [NSString stringWithFormat:@"%d",post.type];
                s_activityTypes[typeId] = post;
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    
    return s_activityTypes;
}


+ (ActivityType*) getActivityType : (NSString*)type
{
    if (!s_activityTypes) {
        return nil;
    }
    return [s_activityTypes objectForKey:type];
}

@end
