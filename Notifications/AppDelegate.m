//
//  AppDelegate.m
//  Notifications
//
//  Created by sdl on 14/04/15.
//  Copyright (c) 2015 sdl. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIMutableUserNotificationAction* deleteAction = [[UIMutableUserNotificationAction alloc] init];
    [deleteAction setIdentifier:@"delete_action_id"];
    [deleteAction setTitle:@"Dismiss"];
    [deleteAction setActivationMode:UIUserNotificationActivationModeBackground];
    [deleteAction setDestructive:YES];
    
    UIMutableUserNotificationAction* replyAction = [[UIMutableUserNotificationAction alloc] init];
    [replyAction setIdentifier:@"reply_action_id"];
    [replyAction setTitle:@"Mark as Fixed"];
    [replyAction setActivationMode:UIUserNotificationActivationModeForeground];
    [replyAction setDestructive:NO];
    
    UIMutableUserNotificationCategory* deleteReplyCategory = [[UIMutableUserNotificationCategory alloc] init];
    [deleteReplyCategory setIdentifier:@"custom_category_id"];
    [deleteReplyCategory setActions:@[replyAction, deleteAction] forContext:UIUserNotificationActionContextDefault];
    
    NSSet* categories = [NSSet setWithArray:@[deleteReplyCategory]];
    UIUserNotificationSettings* settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    return YES;
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler
{
    if([notification.category isEqualToString:@"custom_category_id"])
    {
        if([identifier isEqualToString:@"delete_action_id"])
        {
            NSLog(@"Delete was pressed");
        }
        else if([identifier isEqualToString:@"reply_action_id"])
        {
            NSLog(@"Reply was pressed");
        }
    }
    
    //	Important to call this when finished
    completionHandler();
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    //CLRegion *region = notification.region;
    if ([notification.category isEqualToString:@"custom_category_id"]) {
        NSLog(@"Image category notification is presented to the user");
    }else if([notification.category isEqualToString:@"Email"]){
        NSLog(@"Email category notification is presented to the user");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
