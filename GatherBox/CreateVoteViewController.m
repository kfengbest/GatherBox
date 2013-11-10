//
//  CreateVoteViewController.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "CreateVoteViewController.h"
#import "CategoryView.h"
#import "UIImage+ImageEffects.h"
#import "UINavigationController+MHDismissModalView.h"
#import "AddFriendsViewController.h"
#import "CalendarViewItem.h"
#import "ChooseDateTimeView.h"

#import "AFNetworking/AFNetworking.h"
#import "AFAppDotNetAPIClient.h"
#import "Config.h"
#import "ImageViewCell.h"


#define  PIC_WIDTH 80
#define  PIC_HEIGHT 80
#define  INSETS 10

@interface CreateVoteViewController ()
{
    CategoryView*   mCategoryView;
    ChooseDateTimeView * mChooseDateTimeView;
    NSMutableArray* userList;
}
@end

@implementation CreateVoteViewController

@synthesize buttonWithImage;


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
    
    userList = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 4; i++) {
        NSString *string = [NSString stringWithFormat:@"avatar%d.png",i];
        [userList addObject:string];
    }
    [userList addObject:@"add.png"];
    
    for (int j = 0; j < 3; j++) {
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CalendarView"owner:self options:nil];
        CalendarViewItem * cal = (CalendarViewItem*)[nibView objectAtIndex:0];
        [cal setFrame:CGRectMake(98*j, 165, 98, 194)];
        [self.view addSubview:cal];
        cal.mParent = self;
        cal.mIndex = j;
        [cal setDate: [NSDate date]];
    }
    
    mCategoryView = [[CategoryView alloc] initWithFrame:CGRectMake(0, 570, 320, 400)];
    [self.view addSubview:mCategoryView];
    
    mChooseDateTimeView = [[ChooseDateTimeView alloc] initWithFrame:CGRectMake(0, 570, 320, 300)];
    [self.view addSubview:mChooseDateTimeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectCategory:(id)sender
{
    [UIView beginAnimations:@"ShowCategory" context:nil];
    [UIView setAnimationDuration:0.5];
    mCategoryView.frame = CGRectMake(0, 568-400, 320, 400);
    [UIView commitAnimations];
    

}

- (void) clickOnCalendar: (NSInteger)index
{
    [UIView beginAnimations:@"ShowTime" context:nil];
    [UIView setAnimationDuration:0.5];
    mChooseDateTimeView.frame = CGRectMake(0, 568-250, 320, 250);
    [UIView commitAnimations];
}

-(NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [userList count]; //[fileThumbnails count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageViewCell *myCell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"AttendeeCell"
                                    forIndexPath:indexPath];
    
    NSString* path = userList[indexPath.row];
    myCell.imageView.image = [UIImage imageNamed:path];
    
    return myCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    int x = indexPath.row;
    NSLog(@"%d", x);
    if (x == ([userList count] - 1)) {
        AddFriendsViewController *modal = [self.storyboard instantiateViewControllerWithIdentifier:@"AddFriendsViewController"];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:modal];
        [self presentViewController:nav animated:YES completion:^{
            
        }];
    }
}

- (IBAction)publishActivity:(id)sender
{
    
//    NSString *pathStr=@"http://www.baidu.com" ;
    
//    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@""]];//这里要将url设置为空
//    
//    httpClient.parameterEncoding = AFJSONParameterEncoding;
//    
//    [httpClient setDefaultHeader:@"Accept" value:@"text/json"];
//    
//    
//    NSMutableDictionary *params=[[NSMutableDictionary alloc] init];   // 要传递的json数据是一个字典
//    
//    [params setObject:UserID forKey:@"userId"];
//    
//    [params setObject:[self.contDic objectForKey:@"weiboId" ] forKey:@"operateId"];
//    
//    [params setObject:@"8d0ce196d0eafa27780cc3a7217de71d92474021dc0a4fc593d4f9b9eda320ca" forKey:@"key"];
//    
//    
//    
//    // httpClient 的postPath就是上文中的pathStr，即你要访问的URL地址，这里是向服务器提交一个数据请求，
//    
//    [httpClient postPath:pathStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"data====%@",params);
//        
//        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"Request Successful, response '%@'", responseStr);
//        
//        [responseStr release];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"[HTTPClient Error]: %@", error);
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //NSDictionary *parameters = @{@"foo": @"bar"};
    NSDictionary *parameters = @{@"name": @"BBQQ3", @"activity_type": @"1", @"option1":@"2013-12-1", @"option2":@"2013-12-1", @"option3":@"2013-12-1", @"creator":@"sanvi",@"usernames":@"harryng"};
    
    [manager POST:@"http://http://collect.im/api/activities" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
