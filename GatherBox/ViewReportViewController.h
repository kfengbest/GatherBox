//
//  ViewReportViewController.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReportItem;
@interface ViewReportViewController : UIViewController
@property (nonatomic,strong)IBOutlet ReportItem *option1;
@property (nonatomic,strong)IBOutlet ReportItem *option2;
@property (nonatomic,strong)IBOutlet ReportItem *option3;

@end
