//
//  ReportItem.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportItem : UIView
@property (nonatomic, strong) IBOutlet UIImageView *mDateImage;
@property (nonatomic, strong) IBOutlet UIImageView *mNumImage;
@property (nonatomic, strong) IBOutlet UIScrollView *mScrollView;
@property (nonatomic, strong) IBOutlet UILabel *mDateLabel;
@property (nonatomic, strong) IBOutlet UILabel *mNumLabel;

-(void) init;

@end
