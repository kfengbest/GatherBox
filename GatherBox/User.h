//
//  User.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, strong) NSString* displayName;
@property (nonatomic, strong) NSString* userId;
@property (readonly, nonatomic, unsafe_unretained) NSURL *avatarImageURL;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
