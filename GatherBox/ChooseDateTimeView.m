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
    
//        self.backgroundColor = [UIColor whiteColor];
//        mDatePicker = [ [ UIDatePicker alloc] initWithFrame:CGRectMake(0.0,0.0,300,200)];
//        [self addSubview:mDatePicker];
//        
//        NSDate* minDate = [NSDate date];
//        NSDate* maxDate = [NSDate date];
//        
//        mDatePicker.minimumDate = minDate;
//        mDatePicker.maximumDate = maxDate;
//        mDatePicker.minuteInterval = 15;
//        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        btn.frame = CGRectMake(80, 210, 150, 50);
//        [self addSubview:btn];
//        
//        [btn setTitle:@"Done" forState:UIControlStateNormal];
//        [btn setTitle:@"Done" forState:UIControlStateHighlighted];
//        [btn addTarget:self action:@selector(onOK:) forControlEvents:UIControlEventTouchUpInside];


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
