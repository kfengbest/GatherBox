//
//  AddFriendsViewController.h
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+MHDismissModalView.h"

@interface TestCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UILabel *labelText;
@end

@interface AddFriendsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)IBOutlet UITableView *tableView;
@property(nonatomic,strong) UIView *oldView;
@property(nonatomic,strong) UIImageView *bluredView;
@property(nonatomic,strong) UIImage *screenShotImage;


@end
