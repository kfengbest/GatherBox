//
//  ChooseDateTimeView.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "ChooseDateTimeView.h"
#import "CreateVoteViewController.h"

@interface ChooseDateTimeView ()
{
}
@end

@implementation ChooseDateTimeView
@synthesize mIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (IBAction)onOKClicked:(id)sender {
    
    NSDate* date = self.mDateControl.date;
    [self.mParent setDatetime:self.mIndex withDate:date];
    
    [UIView beginAnimations:@"hide" context:nil];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(0, 600, 320, 480);
    [UIView commitAnimations];
}

- (IBAction)onRightClicked:(id)sender {
}

- (IBAction)onLeftClicked:(id)sender {
}
@end
