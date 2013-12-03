//
//  SceneController.h
//  Fancys
//
//  Created by gyc on 10/19/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "RootMainViewController.h"
#import "ICETutorialController.h"

@interface SceneController : NSObject
#pragma mark- init
+ (SceneController*)sharedInstance;


#pragma mark- RootController;
- (UINavigationController *)rootViewController;

@end
