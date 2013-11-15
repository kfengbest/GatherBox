//
//  Utils.m
//  GatherBox
//
//  Created by Kaven Feng on 11/15/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSString *)getDay:(NSDate*)date{
    NSString *strDay;
    
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init] ;
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    int day = [comps day];
    
    strDay = [NSString stringWithFormat:@"%d", day];
    return strDay;
}

+(NSString *)getTime:(NSDate*)date{
    NSString *time;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"hh:mm:ss"];
    time =[dateFormatter stringFromDate:date];
    
    return time;
}

+(NSString *)getDayWeek:(NSDate*)date{
    NSString *weekDay;
    
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init] ;
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    int week = [comps weekday];
    
    switch (week) {
        case 1:
            weekDay=@"星期日";
            break;
        case 2:
            weekDay=@"星期一";
            break;
        case 3:
            weekDay=@"星期二";
            break;
        case 4:
            weekDay=@"星期三";
            break;
        case 5:
            weekDay=@"星期四";
            break;
        case 6:
            weekDay=@"星期五";
            break;
        case 7:
            weekDay=@"星期六";
            break;
            
        default:
            break;
    }
    
    return weekDay;
}

+(NSString *)getMonth:(NSDate*)date{
    NSString *month;
    
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init] ;
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    int mon = [comps month];
    
    switch ( mon) {
        case 1:
            month=@"Jan";
            break;
        case 2:
            month=@"Fab";
            break;
        case 3:
            month=@"Mar";
            break;
        case 4:
            month=@"Apl";
            break;
        case 5:
            month=@"May";
            break;
        case 6:
            month=@"Jun";
            break;
        case 7:
            month=@"Jul";
            break;
        case 8:
            month=@"Aug";
            break;
        case 9:
            month=@"Sep";
            break;
        case 10:
            month=@"Oct";
            break;
        case 11:
            month=@"Nov";
            break;
        case 12:
            month=@"Dec";
            break;
        default:
            break;
    }
    
    return month;
}

+(NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
    
}

@end
