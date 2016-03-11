//
//  ViewController.m
//  Notifications
//
//  Created by sdl on 14/04/15.
//  Copyright (c) 2015 sdl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target: self
                                                      selector: @selector(myNotifications) userInfo: nil repeats: YES];
    
    [myTimer fire];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)myNotifications{
    NSLog(@"calling for every 5 seconds");
    UILocalNotification* notification = [[UILocalNotification alloc] init];
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    [notification setAlertBody:@"Finnay Acheived Interactive Notifications"];
    [notification setCategory:@"custom_category_id"];
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
   // _button.selected = YES;
    if (_button.selected) {
        _button.backgroundColor = [UIColor redColor];
        _button.selected = NO;
    }else{
        _button.backgroundColor = [UIColor lightGrayColor];
        _button.selected = YES;
    }
    NSLog(@"button pressed");
 //   _button.backgroundColor = [UIColor redColor];
}

@end
