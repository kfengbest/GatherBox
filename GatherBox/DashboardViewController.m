//
//  DashboardViewController.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "DashboardViewController.h"
#import "Activity.h"

@implementation EventCell

-(void) setData :(Activity*) data
{
    self.mData = data;
    self.labelActivityName.text = data.name;
}

@end

@interface DashboardViewController ()

@end

@implementation DashboardViewController

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
    
    NSURLSessionTask *task = [Activity globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        if (!error) {
            self.posts = posts;
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell"];
    [cell setData:[self.posts objectAtIndex:indexPath.row]];
    
    return cell;
    
}

- (IBAction)showHistory:(id)sender {
    [UIView beginAnimations:@"FloatingAnim" context:nil];
    [UIView setAnimationDuration:0.5];
    self.mIndicatorImage.frame = CGRectMake(160, 61, 160, 65);
    [UIView commitAnimations];
    
}

- (IBAction)showLatest:(id)sender {
    [UIView beginAnimations:@"FloatingAnim" context:nil];
    [UIView setAnimationDuration:0.5];
    self.mIndicatorImage.frame = CGRectMake(0, 61, 160, 65);
    [UIView commitAnimations];
}

@end
