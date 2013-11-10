//
//  DashboardViewController.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Activity;

@interface EventCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UILabel *labelActivityName;
@property (nonatomic,strong)IBOutlet Activity* mData;

-(void) setData :(Activity*) data;

@end

@interface DashboardViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UIImageView *mIndicatorImage;

@property (readwrite, nonatomic, strong) NSArray *posts;

- (IBAction)showHistory:(id)sender;
- (IBAction)showLatest:(id)sender;

@end
