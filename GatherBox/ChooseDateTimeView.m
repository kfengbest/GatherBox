//
//  ChooseDateTimeView.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "ChooseDateTimeView.h"

@implementation ChooseDateTimeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor yellowColor];
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
    [UIView beginAnimations:@"hide" context:nil];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(0, 600, 320, 480);
    [UIView commitAnimations];
}

@end
