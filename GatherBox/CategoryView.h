//
//  CategoryView.h
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryItem;
@class CreateVoteViewController;

@interface CategoryView : UIView
@property (nonatomic, strong) NSString* mSelectedItem;
@property (nonatomic, weak) CreateVoteViewController* mParent;

-(void) selectItem : (CategoryItem*)item;
@end
