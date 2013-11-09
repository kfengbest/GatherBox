//
//  CreateVoteViewController.h
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CreateVoteViewController : UIViewController
{
    NSMutableArray *addedPicArray;
}
@property (nonatomic, strong) UIButton *buttonWithImage;
@property (nonatomic, strong) UIImageView *layerMaskedCircleImageView;

@property (retain, nonatomic) IBOutlet UIScrollView *picScroller;
@property (retain, nonatomic) IBOutlet UIButton *plusButton;

- (IBAction)clearPics:(id)sender;
- (IBAction)addPic:(id)sender;

- (void)selectCategory;


@end
