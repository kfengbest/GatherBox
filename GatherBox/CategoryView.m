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

@implementation CategoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://collect.im/api/activities/types.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSArray *postsFromResponse = [responseObject valueForKeyPath:@"data"];
            NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
            for (NSDictionary *attributes in postsFromResponse) {
                
                ActivityType *post = [[ActivityType alloc] initWithAttributes:attributes];
                
                [mutablePosts addObject:post];
            }
            
            for (int j = 0; j < mutablePosts.count; j++) {
                NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CategoryItem"owner:self options:nil];
                CategoryItem * cal = (CategoryItem*)[nibView objectAtIndex:0];
                [cal setFrame:CGRectMake(98*j, 0, 98, 98)];
                [self addSubview:cal];
                cal.mParent = self;
                [cal setData:[mutablePosts objectAtIndex:j]];
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
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
