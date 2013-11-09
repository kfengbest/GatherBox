//
//  VotingViewController.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "VotingViewController.h"
#import "CalendarViewItem.h"

@interface VotingViewController ()

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
    

        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
        self.option1 = (CalendarViewItem*)[nibView objectAtIndex:0];
        [self.option1 setFrame:CGRectMake(98, 150, 98, 194)];
        [self.view addSubview: self.option1];
        self.option1.mParent = self;
        self.option1.mIndex = 0;
        [self.option1 setDate: [NSDate date]];
    
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
    return 15; //[fileThumbnails count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *myCell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"AttendeeCell"
                                    forIndexPath:indexPath];
    
    //NSString* path = fileThumbnails[indexPath.row];
    //  UIImage *img = [UIImage imageNamed:@"Cell.png"];
    
    //  myCell.layer.contents = (id)img.CGImage;
    
    return myCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    int x = indexPath.row;
    NSLog(@"%d", x);
    if (x == 14) {
//        AddFriendsViewController *modal = [self.storyboard instantiateViewControllerWithIdentifier:@"AddFriendsViewController"];
//        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:modal];
//        [self presentViewController:nav animated:YES completion:^{
//            
//        }];
    }
}


@end
