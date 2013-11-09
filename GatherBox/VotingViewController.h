//
//  VotingViewController.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalendarViewItem;

@interface VotingViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic,strong)IBOutlet CalendarViewItem *option1;
@property (nonatomic,strong)IBOutlet CalendarViewItem *option2;
@property (nonatomic,strong)IBOutlet CalendarViewItem *option3;

@end
