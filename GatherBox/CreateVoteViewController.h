//
//  CreateVoteViewController.h
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CreateVoteViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *addedPicArray;
}
@property (nonatomic, strong) UIButton *buttonWithImage;

- (IBAction)selectCategory:(id)sender;

@end
