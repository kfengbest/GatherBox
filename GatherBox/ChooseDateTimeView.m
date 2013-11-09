//
//  ChooseDateTimeView.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "ChooseDateTimeView.h"

@interface ChooseDateTimeView ()
{
    UIDatePicker*   mDatePicker;
}
@end

@implementation ChooseDateTimeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
        self.backgroundColor = [UIColor whiteColor];
        mDatePicker = [ [ UIDatePicker alloc] initWithFrame:CGRectMake(0.0,0.0,300,200)];
        [self addSubview:mDatePicker];
        
        NSDate* minDate = [[NSDate alloc]initWithString:@"1900-01-01 00:00:00 -0500"];
        NSDate* maxDate = [[NSDate alloc]initWithString:@"2099-01-01 00:00:00 -0500"];
        
        mDatePicker.minimumDate = minDate;
        mDatePicker.maximumDate = maxDate;
        mDatePicker.minuteInterval = 15;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(80, 210, 150, 50);
        [self addSubview:btn];
        
        [btn setTitle:@"Done" forState:UIControlStateNormal];
        [btn setTitle:@"Done" forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(onOK:) forControlEvents:UIControlEventTouchUpInside];


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

-(void)onOK:(id)sender{
    [UIView beginAnimations:@"hide" context:nil];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(0, 600, 320, 480);
    [UIView commitAnimations];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDate* _date = mDatePicker.date;
    
}

@end
