//
//  CreateVoteViewController.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "CreateVoteViewController.h"
#import "CategoryView.h"
#import "UIImage+ImageEffects.h"
#import "UINavigationController+MHDismissModalView.h"
#import "AddFriendsViewController.h"
#import "CalendarViewItem.h"
#import "ChooseDateTimeView.h"

#import "AFNetworking/AFNetworking.h"
#import "Config.h"
#import "ImageViewCell.h"
#import "ActivityType.h"
#import "Activity.h"
#import "Utils.h"

#define  PIC_WIDTH 80
#define  PIC_HEIGHT 80
#define  INSETS 10

@interface CreateVoteViewController ()
{
    CategoryView*   mCategoryView;
    ChooseDateTimeView * mChooseDateTimeView;
    NSMutableArray* userList;
    NSMutableArray* options;
    Activity* mActivity;
    
}
@end

@implementation CreateVoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    mActivity = [[Activity alloc] init];
    
    userList = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 4; i++) {
        NSString *string = [NSString stringWithFormat:@"avatar%d.png",i];
        [userList addObject:string];
    }
    [userList addObject:@"add.png"];
    options = [[NSMutableArray alloc] init];
    
    for (int j = 0; j < 3; j++) {
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
        CalendarViewItem * cal = (CalendarViewItem*)[nibView objectAtIndex:0];
        [cal setFrame:CGRectMake(98*j, 165, 98, 194)];
        [self.view addSubview:cal];
        cal.mParent = self;
        cal.mIndex = j+1;
        [cal setDate: [NSDate date]];
        [options addObject:cal];
    }
    
    mCategoryView = [[CategoryView alloc] initWithFrame:CGRectMake(0, 570, 320, 400)];
    [self.view addSubview:mCategoryView];
    mCategoryView.mParent = self;
    
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ChooseDateTime"owner:self options:nil];
    mChooseDateTimeView = (ChooseDateTimeView*)[nibView objectAtIndex:0];
    [mChooseDateTimeView setFrame:CGRectMake(0, 570, 320, 300)];
    [self.view addSubview:mChooseDateTimeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectCategory:(id)sender
{
    [UIView beginAnimations:@"ShowCategory" context:nil];
    [UIView setAnimationDuration:0.5];
    mCategoryView.frame = CGRectMake(0, 568-400, 320, 400);
    [UIView commitAnimations];
    
}

-(void) updateActivityType : (ActivityType*) activityType
{
    [self.mActivityTypeBtn setBackgroundImage:[UIImage imageNamed:activityType.imageUrl] forState:UIControlStateNormal];
    [self.mActivityTypeBtn setBackgroundImage:[UIImage imageNamed:activityType.imageUrl] forState:UIControlStateSelected];
  
    mActivity.type = activityType.type;
    mActivity.name = activityType.name;
    
    self.mActivityTypeLabel.text = activityType.name;
}

- (void) clickOnCalendar: (NSInteger)index
{
    [UIView beginAnimations:@"ShowTime" context:nil];
    [UIView setAnimationDuration:0.5];
    mChooseDateTimeView.frame = CGRectMake(0, 568-250, 320, 250);
    mChooseDateTimeView.mParent = self;
    mChooseDateTimeView.mIndex = index;
    [UIView commitAnimations];
}

-(void) setDatetime : (NSInteger)index withDate : (NSDate*) date
{
    CalendarViewItem* item = [options objectAtIndex:index -1];
    [item setDate:date];
}

-(NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [userList count]; //[fileThumbnails count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageViewCell *myCell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"AttendeeCell"
                                    forIndexPath:indexPath];
    
    NSString* path = userList[indexPath.row];
    myCell.imageView.image = [UIImage imageNamed:path];
    
    return myCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    int x = indexPath.row;
    NSLog(@"%d", x);
    if (x == ([userList count] - 1)) {
        [self performSegueWithIdentifier:@"CreateActivity2AddFriends" sender:self];
    }
}

- (IBAction)publishActivity:(id)sender
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary* parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:mActivity.name forKey:@"name"];
    [parameters setObject:[NSString stringWithFormat:@"%d",mActivity.type] forKey:@"activity_type"];
    [parameters setObject:[Utils stringFromDate: ((CalendarViewItem*)[options objectAtIndex:0]).mDate] forKey:@"option1"];
    [parameters setObject:[Utils stringFromDate: ((CalendarViewItem*)[options objectAtIndex:1]).mDate] forKey:@"option2"];
    [parameters setObject:[Utils stringFromDate: ((CalendarViewItem*)[options objectAtIndex:2]).mDate] forKey:@"option3"];
    [parameters setObject:@"k3" forKey:@"creator"];
    [parameters setObject:@"u3" forKey:@"usernames"];
    
    [manager POST:@"http://collect.im/api/activities" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
