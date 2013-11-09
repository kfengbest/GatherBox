//
//  CategoryView.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "CategoryView.h"

@implementation CategoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];

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
    self.frame = CGRectMake(1024, 0, 0, 768);
    [UIView commitAnimations];
}
@end
