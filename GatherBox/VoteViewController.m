//
//  VoteViewController.m
//  VirtualBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "VoteViewController.h"

@interface VoteViewController ()
{
    NSMutableArray* fileThumbnails;
}
@end

@implementation VoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        NSString* path = [[NSBundle mainBundle] pathForResource:@"FileLists" ofType:@"plist"];
        NSDictionary* dic = [[NSDictionary alloc] initWithContentsOfFile:path];
        //  fileThumbnails = [dic objectForKey:@"Thumbnails"];
        fileThumbnails = [dic objectForKey:@"SculptFiles"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
    return 5; //[fileThumbnails count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *myCell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"FriendCell"
                                    forIndexPath:indexPath];
    
    //NSString* path = fileThumbnails[indexPath.row];
    UIImage *img = [UIImage imageNamed:@"Cell.png"];
    
    myCell.layer.contents = (id)img.CGImage;
    
    return myCell;
}

@end
