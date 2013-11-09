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


#define  PIC_WIDTH 80
#define  PIC_HEIGHT 80
#define  INSETS 10

@interface CreateVoteViewController ()
{
    CategoryView*   mCategoryView;
}
@end

@implementation CreateVoteViewController

@synthesize buttonWithImage;


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
    
    addedPicArray =[[NSMutableArray alloc]init];
    
    
//    mCategoryView = [[CategoryView alloc] initWithFrame:CGRectMake(0, 480, 320, 200)];
//    [self.view addSubview:mCategoryView];
    

    for (int j = 0; j < 3; j++) {
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
        CalendarViewItem * cal = (CalendarViewItem*)[nibView objectAtIndex:0];
        [cal setFrame:CGRectMake(98*j, 150, 98, 194)];
        [self.view addSubview:cal];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectCategory:(id)sender
{
    //    [UIView beginAnimations:@"ShowCategory" context:nil];
    //    [UIView setAnimationDuration:0.5];
    //    mCategoryView.frame = CGRectMake(0, 200, 320, 200);
    //    [UIView commitAnimations];
    
    AddFriendsViewController *modal = [self.storyboard instantiateViewControllerWithIdentifier:@"AddFriendsViewController"];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:modal];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
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




@end
