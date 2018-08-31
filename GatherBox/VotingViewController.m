//
//  VotingViewController.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "VotingViewController.h"
#import "CalendarViewItem.h"
#import "ImageViewCell.h"
#import "AddFriendsViewController.h"
#import "ActivityType.h"
#import "Activity.h"
#import "AFNetworking/AFNetworking.h"
#import "Config.h"
#import "Option.h"

@interface VotingViewController ()
{
    NSMutableArray* userList;
    NSMutableArray *mutableOptions;
}
@end

@implementation VotingViewController
@synthesize data;

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
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString* url = [NSString stringWithFormat:@"http://collect.im/api/activities/show.json?id=%@",self.data.oid];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // Load data
        NSDictionary *postsFromResponse = [responseObject valueForKeyPath:@"data"];
        NSArray* options = [postsFromResponse valueForKeyPath:@"options"];
        mutableOptions = [NSMutableArray arrayWithCapacity:[options count]];
        for (int i = 0; i < [options count]; i++)
        {
            NSDictionary *attributes = [options objectAtIndex:i];
            Option *opt = [[Option alloc] initWithAttributes:attributes];
            [mutableOptions addObject:opt];
        }
        
        // Display in UI
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
        self.option1 = (CalendarViewItem*)[nibView objectAtIndex:0];
        [self.option1 setFrame:CGRectMake(10, 180, 98, 194)];
        [self.view addSubview: self.option1];
        self.option1.mParent = self;
        self.option1.mIndex = 1;
        self.option1.bVotingMode = true;
        
        Option* opt1 = [mutableOptions objectAtIndex:0];
        [self.option1 setDate: opt1.time];
        
        NSArray* nibView2 =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
        self.option2 = (CalendarViewItem*)[nibView2 objectAtIndex:0];
        [self.option2 setFrame:CGRectMake(10 + 98, 180, 98, 194)];
        [self.view addSubview: self.option2];
        self.option2.mParent = self;
        self.option2.bVotingMode = true;
        self.option2.mIndex = 2;
        Option* opt2 = [mutableOptions objectAtIndex:1];
        [self.option2 setDate: opt2.time];
        
        NSArray* nibView3 =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
        self.option3 = (CalendarViewItem*)[nibView3 objectAtIndex:0];
        [self.option3 setFrame:CGRectMake(10 + 98 * 2, 180, 98, 194)];
        [self.view addSubview: self.option3];
        self.option3.mParent = self;
        self.option3.bVotingMode = true;
        self.option3.mIndex = 3;
        Option* opt3 = [mutableOptions objectAtIndex:2];
        [self.option3 setDate: opt3.time];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    userList = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 4; i++) {
        NSString *string = [NSString stringWithFormat:@"avatar%d.png",i];
        [userList addObject:string];
    }
    [userList addObject:@"add.png"];
    

    ActivityType* typeActivity = [ActivityType getActivityType:[NSString stringWithFormat:@"%d",self.data.type]];
    self.activityTypeImg.image = [UIImage imageNamed:typeActivity.imageUrl];
    self.activeTypeLabel.text = typeActivity.name;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [userList count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageViewCell *myCell = [collectionView
                             dequeueReusableCellWithReuseIdentifier:@"VotingAttendeeCell"
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
        [self performSegueWithIdentifier:@"Voting2AddFriends" sender:self];
    }
}


- (void)viewWillDisappear:(BOOL)animated
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary* parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:self.data.oid forKey:@"activity_id"];
    [parameters setObject:@"kaven" forKey:@"username"];
    [parameters setObject:@"kaven" forKey:@"options"];
    
    
    [manager POST:@"http://collect.im/api/activities/vote" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
