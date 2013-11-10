//
//  CategoryItem.h
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryView;
@class ActivityType;

@interface CategoryItem : UIView

@property (nonatomic, strong) IBOutlet UIImageView *mImage;
@property (nonatomic, strong) IBOutlet UILabel *mTitle;
@property (nonatomic, strong) CategoryView* mParent;
@property (nonatomic, strong) ActivityType* mData;

-(void) setData : (ActivityType*)data;
@end
