//
//  DashboardViewController.m
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "DashboardViewController.h"
#import "Activity.h"
#import "AFNetworking/AFNetworking.h"
#import "VotingViewController.h"
#import "ActivityType.h"

@implementation EventCell

-(void) setData :(Activity*) data
{
    self.mData = data;
    self.labelActivityName.text = data.name;
    self.mCreateorImage.image = [UIImage imageNamed: data.creator];
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
    
    
//    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml",@"application/json", @"text/html",nil];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    
//    [manager.requestSerializer setValue:@"OAuth oauth_signature_method=\"HMAC-SHA1\",oauth_version=\"1.0\",oauth_nonce=\"mnxT96\",oauth_timestamp=\"1385517611\",oauth_consumer_key=\"40e8169d-72eb-4875-bdd6-210822dcfd18\",oauth_token=\"ZBCZ%2BXcwZWnnN88Nd2JRiMeICO4%3D\",oauth_signature=\"OldNwg2qutcRtpDbqTXQTW72rFA%3D\"" forHTTPHeaderField:@"Authorization"];
//    
//    [manager GET:@"https://qa2376.autodeskplm.com/api/rest/v1/workspaces/1/items" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        
//        NSDictionary* dic = (NSDictionary*)responseObject;
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//    
//    
    
    
//    NSURL *url = [NSURL URLWithString:@"https://qa2376.autodeskplm.com/api/rest/v1/workspaces/1/items/1966/attachments/2357/downloadEditableContent"];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setValue:@"OAuth oauth_signature_method=\"HMAC-SHA1\",oauth_version=\"1.0\",oauth_nonce=\"lBNsRr\",oauth_timestamp=\"1385523330\",oauth_consumer_key=\"40e8169d-72eb-4875-bdd6-210822dcfd18\",oauth_token=\"ZBCZ%2BXcwZWnnN88Nd2JRiMeICO4%3D\",oauth_signature=\"635v5JNwrgxsJ1aRSO0zhEgLHFY%3D\"" forHTTPHeaderField:@"Authorization"];
//    
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"A.f3d"];
//    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:path append:NO];
//    
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"Successfully downloaded file to %@", path);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//    
//    
//    [operation start];
    
     
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://collect.im/api/activities.json?type=current" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *postsFromResponse = [responseObject valueForKeyPath:@"data"];
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (int i = 0; i < [postsFromResponse count]; i++)
        {
            NSDictionary *attributes = [postsFromResponse objectAtIndex:i];
            Activity *post = [[Activity alloc] initWithAttributes:attributes];
            
            int index = i % 5;
            if (index == 0) {
                index = 1;
            }
            NSString *string = [NSString stringWithFormat:@"avatar%d.png",index];
            post.creator = string;
            [mutablePosts addObject:post];
        }
        
        self.posts = mutablePosts;
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    // load activity types.
    [ActivityType allTypes];
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"Dashboard2Voting"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSLog(@"%d", indexPath.row);
        
        VotingViewController* vc = (VotingViewController*)[segue destinationViewController];
        vc.data = self.posts[indexPath.row];
    }}

@end
