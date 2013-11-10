//
//  DashboardViewController.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UILabel *labelText;
@end

@interface DashboardViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UIImageView *mIndicatorImage;
- (IBAction)showHistory:(id)sender;
- (IBAction)showLatest:(id)sender;

@end
