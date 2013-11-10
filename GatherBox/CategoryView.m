//
//  CategoryView.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "CategoryView.h"
#import "CategoryItem.h"
#import "ActivityType.h"

@implementation CategoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];

        NSURLSessionTask *task = [ActivityType globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
            if (!error) {
                self.posts = posts;
                
                for (int j = 0; j < posts.count; j++) {
                    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CategoryItem"owner:self options:nil];
                    CategoryItem * cal = (CategoryItem*)[nibView objectAtIndex:0];
                    [cal setFrame:CGRectMake(90*j, 0, 90, 90)];
                    [self addSubview:cal];
                    cal.mParent = self;
                    [cal setData:[posts objectAtIndex:j]];
                }
            }
        }];
        
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
