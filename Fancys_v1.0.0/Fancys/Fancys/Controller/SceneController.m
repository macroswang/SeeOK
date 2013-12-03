//
//  SceneController.m
//  Fancys
//
//  Created by gyc on 10/19/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "SceneController.h"



@implementation SceneController
+ (SceneController*)sharedInstance
{
    // 1
    static SceneController *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[SceneController alloc] init];
    });
    return _sharedInstance;
}
///////////////////////////////////////////RootController////////////////////////////////////////////////////
#pragma mark- RootController
- (UINavigationController *)rootViewController
{
    UINavigationController* navigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:[self rootMainViewController]];
    [navigationController setNavigationBarHidden:YES animated:NO];
    return  navigationController;
}



- (RootMainViewController *)rootMainViewController
{
    RootMainViewController* controller =[[RootMainViewController alloc] initWithNibName:@"RootMainViewController" bundle:nil];
    
    return controller;
    
}

////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark- 登陆界面
- (LoginViewController *)loginViewController
{
    LoginViewController* controller =[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    
    return controller;
    
}







@end
