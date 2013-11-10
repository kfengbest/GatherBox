//
//  AppDelegate.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Register with apple that this app will use push notification
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert |
                                                                           UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge)];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Convert the binary data token into an NSString (see below for the implementation of this function)
    NSString *str = [NSString stringWithFormat:@"%@", deviceToken];
    int len = str.length;
    NSString *token = [[str substringWithRange:NSMakeRange(1,len-2)] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // Show the device token obtained from apple to the log
    NSLog(@"deviceToken: %@", token);
    
    
    NSURL *url = [NSURL URLWithString:@"http://collect.im/"];
    NSDictionary *parameters = [NSDictionary dictionaryWithObject:token forKey:@"token"];
    
//    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
//    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
//    
//    [client postPath:@"api/tokens/ios" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error: %@", error.description);
//    }];
}

@end
