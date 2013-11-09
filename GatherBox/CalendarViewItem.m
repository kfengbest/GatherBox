//
//  CalendarViewItem.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "CalendarViewItem.h"
#import "CreateVoteViewController.h"

@implementation CalendarViewItem
@synthesize mStep;
@synthesize mDay;
@synthesize mWeek;
@synthesize mTime;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
   // self.backgroundColor = [UIColor redColor];
    [self.mParent clickOnCalendar: self.mIndex];
}

- (void) setDate: (NSDate*)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
//    
//    NSInteger day = [components day];
//    NSInteger month= [components month];
//    NSInteger year= [components year];
    
   
}

-(NSString *)getDayWeek:(int)dayDelay{
    NSString *weekDay;
    NSDate *dateNow;
    dateNow=[NSDate dateWithTimeIntervalSinceNow:dayDelay*24*60*60];//dayDelay代表向后推几天，如果是0则代表是今天，如果是1就代表向后推24小时，如果想向后推12小时，就可以改成dayDelay*12*60*60,让dayDelay＝1
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//设置成中国阳历
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;//这句我也不明白具体时用来做什么。。。
    comps = [calendar components:unitFlags fromDate:dateNow];
    long weekNumber = [comps weekday]; //获取星期对应的长整形字符串
    long day=[comps day];//获取日期对应的长整形字符串
    long year=[comps year];//获取年对应的长整形字符串
    long month=[comps month];//获取月对应的长整形字符串
    long hour=[comps hour];//获取小时对应的长整形字符串
    long minute=[comps minute];//获取月对应的长整形字符串
    long second=[comps second];//获取秒对应的长整形字符串
    NSString *riQi =[NSString stringWithFormat:@"%ld日",day];//把日期长整形转成对应的汉字字符串
    switch (weekNumber) {
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
    weekDay=[riQi stringByAppendingString:weekDay];//这里我本身的程序里只需要日期和星期，所以上面的年月时分秒都没有用上
    return weekDay;
}

@end
