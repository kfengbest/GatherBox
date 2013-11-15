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
#import "AFNetworking/AFNetworking.h"
#import "CreateVoteViewController.h"

@implementation CategoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        NSMutableDictionary* dic = [ActivityType allTypes];
        NSArray *mutablePosts = [dic allValues];
        
        int s_Width = 98;
        int s_Height = 98;
        
        for (int i = 0; i < mutablePosts.count; i++) {
            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CategoryItem"owner:self options:nil];
            CategoryItem * cal = (CategoryItem*)[nibView objectAtIndex:0];
            
            int dy = (int)(i/3);
            int dx = (int)(i%3);
            
            [cal setFrame:CGRectMake(s_Width*dx, s_Height*dy, s_Width, s_Height)];
            [self addSubview:cal];
            cal.mParent = self;
            [cal setData:[mutablePosts objectAtIndex:i]];
        }
        
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

-(void) selectItem : (CategoryItem*)item
{
    [self.mParent updateActivityType:item.mData];
}

@end
