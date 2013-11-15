//
//  Activity.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "Activity.h"
#import "AFNetworking/AFNetworking.h"
#import "Config.h"
#import "User.h"

@implementation Activity

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.type = [[attributes valueForKeyPath:@"activity_type"] integerValue];
    self.name = [attributes valueForKeyPath:@"name"];
    self.oid = [[attributes valueForKeyPath:@"id"] valueForKeyPath:@"$oid"];
    User* user = [[User alloc] initWithAttributes:[attributes valueForKeyPath:@"creator"]];
    self.creator = user;

    return self;
}

- (void)loadDetail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString* url = [NSString stringWithFormat:@"http://collect.im/api/activities/show.json?id=%@",self.oid];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *postsFromResponse = [responseObject valueForKeyPath:@"data"];
        NSArray* options = [postsFromResponse valueForKeyPath:@"options"];
        
        NSMutableArray *mutableOptions = [NSMutableArray arrayWithCapacity:[options count]];
        for (int i = 0; i < [options count]; i++)
        {

        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


@end
