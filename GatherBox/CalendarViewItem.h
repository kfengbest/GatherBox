//
//  CalendarViewItem.h
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreateVoteViewController;

@interface CalendarViewItem : UIView

@property (nonatomic, strong) IBOutlet UIImageView *mStep;
@property (nonatomic, strong) IBOutlet UILabel *mMon;
@property (nonatomic, strong) IBOutlet UILabel *mDay;
@property (nonatomic, strong) IBOutlet UILabel *mWeek;
@property (nonatomic, strong) IBOutlet UILabel *mTime;
@property (nonatomic, strong) CreateVoteViewController* mParent;
@property (nonatomic) NSInteger mIndex;
@property (nonatomic) bool bVotingMode;
@property (nonatomic) bool bTicked;

- (void) setDate: (NSDate*)date;

@end
