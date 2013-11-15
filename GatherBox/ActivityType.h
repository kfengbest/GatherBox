//
//  ActivityType.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityType : NSObject

@property (nonatomic, assign) NSUInteger type;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* imageUrl;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
