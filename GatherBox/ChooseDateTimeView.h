//
//  ChooseDateTimeView.h
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreateVoteViewController;

@interface ChooseDateTimeView : UIView
@property (strong, nonatomic) IBOutlet UIButton *mOKButton;
@property (strong, nonatomic) IBOutlet UIButton *mRightButton;
@property (strong, nonatomic) IBOutlet UIButton *mLeftButton;
@property (strong, nonatomic) IBOutlet UIDatePicker *mDateControl;
@property (nonatomic, strong) CreateVoteViewController* mParent;
@property (nonatomic) NSInteger mIndex;

- (IBAction)onOKClicked:(id)sender;
- (IBAction)onRightClicked:(id)sender;
- (IBAction)onLeftClicked:(id)sender;

@end
