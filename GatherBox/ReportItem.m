//
//  ReportItem.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "ReportItem.h"

@implementation ReportItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        

        
    }
    return self;
}

-(void) init
{
    int iconW = 90;
    int iconH = 90;
    int num = 10;
    
    self.mScrollView.contentSize = CGSizeMake(iconW * num,iconH * num);

    for (int i = 0; i < num; i++) {
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(iconW * i, 0, iconW, iconH)];
        imageView.image = [UIImage imageNamed: @"image-holder.png"];
        [self.mScrollView addSubview:imageView];
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
