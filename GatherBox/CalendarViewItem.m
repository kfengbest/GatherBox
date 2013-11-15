//
//  CalendarViewItem.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "CalendarViewItem.h"
#import "CreateVoteViewController.h"
#import "Utils.h"

@implementation CalendarViewItem
@synthesize mStep;
@synthesize mDay;
@synthesize mWeek;
@synthesize mTime;
@synthesize mDate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bVotingMode = false;
        self.bTicked = false;
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
    if (self.bVotingMode) {
        if (self.bTicked) {
            self.bTicked = false;
            NSString *string = [NSString stringWithFormat:@"step%d.png",self.mIndex];
            self.mStep.image = [UIImage imageNamed:string];

        }else
        {
            self.bTicked = true;
            self.mStep.image = [UIImage imageNamed:@"tick-date.png"];

        }
        
    }
    else
        [self.mParent clickOnCalendar: self.mIndex];
}

- (void) setDate: (NSDate*)date
{
    self.mDate = date;
    NSString *string = [NSString stringWithFormat:@"step%d.png",self.mIndex];
    self.mStep.image = [UIImage imageNamed:string];

    self.mTime.text = [Utils getTime:date];
    self.mWeek.text = [Utils getDayWeek:date];
    self.mMon.text = [Utils getMonth:date];
    self.mDay.text = [Utils getDay:date];
}

@end
