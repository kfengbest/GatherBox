//
//  Utils.h
//  GatherBox
//
//  Created by Kaven Feng on 11/15/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(NSString *)getDayWeek:(NSDate*)date;
+(NSString *)getTime:(NSDate*)date;
+(NSString *)getDay:(NSDate*)date;
+(NSString *)getMonth:(NSDate*)date;
    
@end


