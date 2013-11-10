//
//  Activity.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject
@property (nonatomic, assign) NSUInteger type;
@property (nonatomic, strong) NSString* guid;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* creator;
@property (readwrite, nonatomic, strong) NSMutableArray* options;
@property (readwrite, nonatomic, strong) NSMutableArray* users;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
