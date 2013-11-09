//
//  ViewReportViewController.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "ViewReportViewController.h"
#import "ReportItem.h"

@interface ViewReportViewController ()

@end

@implementation ViewReportViewController
@synthesize option1, option2,option3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ReportItem"owner:self options:nil];
    self.option1 = (ReportItem*)[nibView objectAtIndex:0];
    [self.option1 setFrame:CGRectMake(0, 100, 320, 130)];
    [self.view addSubview: self.option1];
    [self.option1 init];

    NSArray* nibView2 =  [[NSBundle mainBundle] loadNibNamed:@"ReportItem"owner:self options:nil];
    self.option2 = (ReportItem*)[nibView2 objectAtIndex:0];
    [self.option2 setFrame:CGRectMake(0, 100 + 130 + 20, 320, 130)];
    [self.view addSubview: self.option2];
    [self.option2 init];

    NSArray* nibView3 =  [[NSBundle mainBundle] loadNibNamed:@"ReportItem"owner:self options:nil];
    self.option3 = (ReportItem*)[nibView3 objectAtIndex:0];
    [self.option3 setFrame:CGRectMake(0, 100 + (130 + 20) * 2, 320, 130)];
    [self.view addSubview: self.option3];
    [self.option3 init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
