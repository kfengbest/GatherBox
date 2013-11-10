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

@interface VotingViewController ()
{
    NSMutableArray* userList;
}
@end

@implementation VotingViewController

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
    
    userList = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 4; i++) {
        NSString *string = [NSString stringWithFormat:@"avatar%d.png",i];
        [userList addObject:string];
    }
    [userList addObject:@"add.png"];
    
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
    self.option1 = (CalendarViewItem*)[nibView objectAtIndex:0];
    [self.option1 setFrame:CGRectMake(5, 150, 98, 194)];
    [self.view addSubview: self.option1];
    self.option1.mParent = self;
    self.option1.mIndex = 1;
    self.option1.bVotingMode = true;
    [self.option1 setDate: [NSDate date]];
    
    NSArray* nibView2 =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
    self.option2 = (CalendarViewItem*)[nibView2 objectAtIndex:0];
    [self.option2 setFrame:CGRectMake(5 + 98, 150, 98, 194)];
    [self.view addSubview: self.option2];
    self.option2.mParent = self;
    self.option2.bVotingMode = true;

    self.option2.mIndex = 2;
    [self.option2 setDate: [NSDate date]];
    
    NSArray* nibView3 =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
    self.option3 = (CalendarViewItem*)[nibView3 objectAtIndex:0];
    [self.option3 setFrame:CGRectMake(5 + 98 * 2, 150, 98, 194)];
    [self.view addSubview: self.option3];
    self.option3.mParent = self;
    self.option3.bVotingMode = true;

    self.option3.mIndex = 3;
    [self.option3 setDate: [NSDate date]];
    
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
        AddFriendsViewController *modal = [self.storyboard instantiateViewControllerWithIdentifier:@"AddFriendsViewController"];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:modal];
        [self presentViewController:nav animated:YES completion:^{
            
        }];
    }
}


@end
