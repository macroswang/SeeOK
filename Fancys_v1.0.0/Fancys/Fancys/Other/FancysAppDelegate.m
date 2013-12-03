//
//  FancysAppDelegate.m
//  Fancys
//
//  Created by gyc on 10/19/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "FancysAppDelegate.h"
#import "HomeViewController.h"
#import "SlideViewController.h"
#import "MMDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"

@implementation FancysAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //config framework
    [self configureFramework];

    //loadRootView
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController =[[SceneController sharedInstance] rootViewController];

    //test
    [self exampleTest];

    //init rootView
//    UIViewController * leftSideDrawerViewController = [[SlideViewController alloc] init];
//    
//    UIViewController * centerViewController = [[HomeViewController alloc] init];
//    
//    
//    
//    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
//    
//    MMDrawerController * drawerController = [[MMDrawerController alloc]
//                                             initWithCenterViewController:navigationController
//                                             leftDrawerViewController:leftSideDrawerViewController
//                                             ];
//    [drawerController setMaximumRightDrawerWidth:200.0];
//    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
//    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
//    
//    [drawerController
//     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//         MMDrawerControllerDrawerVisualStateBlock block;
//         block = [[MMExampleDrawerVisualStateManager sharedManager]
//                  drawerVisualStateBlockForDrawerSide:drawerSide];
//         if(block){
//             block(drawerController, drawerSide, percentVisible);
//         }
//     }];
//    
//    [self.window setRootViewController:drawerController];
//    self.window.backgroundColor = [UIColor whiteColor];
    
    //show Window
    [self.window makeKeyAndVisible];
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



#pragma mark- ConfigureFramework
- (void) configureFramework
{
   //lumberjack
    [self configLumberjack];
   //parse
    [self configParse];
}

 //config lumberjack
- (void) configLumberjack
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    //将Log写入文件
    //       DDFileLogger*  fileLogger = [[DDFileLogger alloc] init];
    //       fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    //       fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    //       [DDLog addLogger:fileLogger];
}
//config parse
- (void) configParse
{
   [Parse setApplicationId:kParseApplicationID clientKey:kParseClientKey];
}


#pragma mark- MainView
- (void) initMainView
{

    
    
    
}
#pragma mark -Test
- (void) exampleTest
{
    DLog(@"test～～～～～～～～～成功==");
    
//   PFQuery *query = [PFQuery queryWithClassName:@"Player"];
//   [query whereKey:@"Name" equalTo:@"John"];
//       [query whereKey:@"Score" greaterThan:@1000];
//        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//          if (!error) {
//              DDLogCVerbose(@"Successfully retrieved: %@", objects);
//          } else {
//               DDLogCVerbose(@"Error: %@", [error localizedDescription]);
//          }
//      }];
    
   
   
//     [player save];
    
//    
//    UIImage* loadImage =[UIImage imageNamed:@"tutorial_background_00@2x.jpg"];
//     NSData *pictureData = UIImagePNGRepresentation(loadImage);
//    // 1
//    PFFile *image = [PFFile fileWithName:@"picture" data:pictureData];
//    
//    [image saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            NSLog(@"成功");
//            // 2
//       
//            
//            PFObject *player = [PFObject objectWithClassName:@"UserGuide"];
//            player[@"pageIndex"] = @0;
//            player[@"pageTitle"] = @"TitleOne";
//            player[@"description"] = @"Champs-Elysées by night";
//             player[@"description"] = @"Champs-Elysées by night";
//            player[@"pictureName"] = @"tutorial_background_00@2x.jpg";
//             player[@"picture"] = image;
//            // 3
//            [player saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                // 4
//                if (succeeded) {
//                   NSLog(@"成功111111");
//                } else {
//                    [[[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//                }
//            }];
//
//          
//        } else {
//            // 5
//            [[[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//        }
//    } progressBlock:^(int percentDone) {
//        NSLog(@"Uploaded: %d%%", percentDone);
//    }];
}
@end
