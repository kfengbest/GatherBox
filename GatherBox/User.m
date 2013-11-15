//
//  User.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    if (!attributes) {
        self.userId = @"DefaultID";
        self.displayName = @"DefaultName";
        return self;
    }
    
    self.userId = [attributes valueForKeyPath:@"username"];
    self.displayName = [attributes valueForKeyPath:@"name"];
   // self.avatarImageURLString = [attributes valueForKeyPath:@"avatar_image.url"];
    
    return self;
}

@end
