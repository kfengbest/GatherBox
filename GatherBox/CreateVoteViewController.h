//
//  CreateVoteViewController.h
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ActivityType;
@class CalendarViewItem;

@interface CreateVoteViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
}
@property (strong, nonatomic) IBOutlet UIButton *mActivityTypeBtn;
@property (strong, nonatomic) IBOutlet UILabel *mActivityTypeLabel;

- (IBAction)selectCategory:(id)sender;
- (IBAction)publishActivity:(id)sender;
- (void) clickOnCalendar: (NSInteger)index;
-(void) setDatetime : (NSInteger)index withDate : (NSDate*) date;

-(void) updateActivityType : (ActivityType*) activityType;

@end
