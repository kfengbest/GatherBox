//
//  CategoryItem.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "CategoryItem.h"
#import "CategoryView.h"
#import "ActivityType.h"

@implementation CategoryItem

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
    [self.mParent selectItem:self];
}

-(void) setData : (ActivityType*)data
{
    self.mData = data;
    self.mTitle.text = data.name;
    NSString *string = [NSString stringWithFormat:@"type%d.png",data.type];
    self.mImage.image = [UIImage imageNamed:string];
}

@end
