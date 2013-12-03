//
//  RootMainViewController.m
//  Fancys
//
//  Created by gyc on 11/16/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "RootMainViewController.h"
#import "ICETutorialController.h"
#import "HomeViewController.h"
#import "SlideViewController.h"
#import "MMDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "ParseLoginViewController.h"
#import "ParseSignUpViewController.h"
@interface RootMainViewController ()<PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate>
@property (strong, nonatomic) ICETutorialController *guildController;
@end

@implementation RootMainViewController

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
    // Do any additional setup after loading the view from its nib.
   
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        [self performSelector:@selector(initMainViewController)];
    } else {
        [self performSelector:@selector(initUserGuildController)];
    }
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- MainViewController
- (void) initMainViewController
{
    UIViewController * leftSideDrawerViewController = [[SlideViewController alloc] initWithNibName:@"SlideViewController" bundle:nil];
    
    UIViewController * centerViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
  
//    
//    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
    
    MMDrawerController * drawerController = [[MMDrawerController alloc]
                                             initWithCenterViewController:centerViewController
                                             leftDrawerViewController:leftSideDrawerViewController
                                             ];
    [drawerController setMaximumRightDrawerWidth:200.0];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
//    [self.view.window setRootViewController:drawerController];

    [self.navigationController pushViewController:drawerController animated:YES];
   
}

#pragma mark- User Guiled
- (void) initUserGuildController
{
    
    // Init the pages texts, and pictures.
    ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 1"
                                                            description:@"Champs-Elysées by night"
                                                            pictureName:@"tutorial_background_00@2x.jpg"];
    ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 2"
                                                            description:@"The Eiffel Tower with\n cloudy weather"
                                                            pictureName:@"tutorial_background_01@2x.jpg"];
    ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 3"
                                                            description:@"An other famous street of Paris"
                                                            pictureName:@"tutorial_background_02@2x.jpg"];
    ICETutorialPage *layer4 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 4"
                                                            description:@"The Eiffel Tower with a better weather"
                                                            pictureName:@"tutorial_background_03@2x.jpg"];
    ICETutorialPage *layer5 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 5"
                                                            description:@"The Louvre's Museum Pyramide"
                                                            pictureName:@"tutorial_background_04@2x.jpg"];
    //Change Title
    
    
    // Set the common style for SubTitles and Description (can be overrided on each page).
    ICETutorialLabelStyle *subStyle = [[ICETutorialLabelStyle alloc] init];
    [subStyle setFont:TUTORIAL_SUB_TITLE_FONT];
    [subStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [subStyle setLinesNumber:TUTORIAL_SUB_TITLE_LINES_NUMBER];
    [subStyle setOffset:TUTORIAL_SUB_TITLE_OFFSET];
    
    ICETutorialLabelStyle *descStyle = [[ICETutorialLabelStyle alloc] init];
    [descStyle setFont:TUTORIAL_DESC_FONT];
    [descStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [descStyle setLinesNumber:TUTORIAL_DESC_LINES_NUMBER];
    [descStyle setOffset:TUTORIAL_DESC_OFFSET];
    
    // Load into an array.
    NSArray *tutorialLayers = @[layer1,layer2,layer3,layer4,layer5];
    
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.guildController = [[ICETutorialController alloc] initWithNibName:@"ICETutorialController_iPhone"
                                                                       bundle:nil
                                                                     andPages:tutorialLayers];
    } else {
        self.guildController = [[ICETutorialController alloc] initWithNibName:@"ICETutorialController_iPad"
                                                                       bundle:nil
                                                                     andPages:tutorialLayers];
    }
    
    // Set the common styles, and start scrolling (auto scroll, and looping enabled by default)
    [self.guildController setCommonPageSubTitleStyle:subStyle];
    [self.guildController setCommonPageDescriptionStyle:descStyle];
    
    __unsafe_unretained typeof(self) weakSelf = self;
    // Set button 1 action.
    [self.guildController setButton1Block:^(UIButton *button){
        NSLog(@"Button 1 pressed.");
        [weakSelf performSelector:@selector(initLoginViewController)];//登陆
    }];
    
    // Set button 2 action, stop the scrolling.
   
    [self.guildController setButton2Block:^(UIButton *button){
        NSLog(@"Button 2 pressed.");
        NSLog(@"Auto-scrolling stopped.");
         [weakSelf performSelector:@selector(initSignUpViewController)];//注册
//        [weakSelf.guildController stopScrolling];
    }];
    
    // Run it.
    [self.guildController startScrolling];
    
    //add rootController
  [self.navigationController pushViewController:self.guildController animated:NO];
    
    
}

#pragma mark- LoginViewController
- (void) initLoginViewController
{
    ParseLoginViewController *logInController = [[ParseLoginViewController alloc] init];
    logInController.delegate = self;
    logInController.fields = PFLogInFieldsUsernameAndPassword
    | PFLogInFieldsDismissButton
    //    | PFLogInFieldsFacebook
    //    | PFLogInFieldsTwitter
    | PFLogInFieldsLogInButton
//    | PFLogInFieldsSignUpButton
     | PFLogInFieldsPasswordForgotten;
    
//     [self presentModalViewController:logInController animated:NO];
    
      [self.navigationController pushViewController:logInController animated:YES];

}

#pragma mark- SignUpViewController
- (void) initSignUpViewController
{
    ParseSignUpViewController *signUpController = [[ParseSignUpViewController alloc] init];
    signUpController.delegate = self;
   [self.navigationController pushViewController:signUpController animated:YES];
}

#pragma mark- parseLogin delegate
- (void)logInViewController:(PFLogInViewController *)controller
               didLogInUser:(PFUser *)user {
    //   [self.view.window setRootViewController:[[SceneController sharedInstance] mainRootViewController]];
    DDLogCVerbose(@"deng lu～～～～～～～～～成功==");
//     [self.navigationController popViewControllerAnimated:YES];
    [self performSelector:@selector(initMainViewController)];
    
    
    //  [self dismissModalViewControllerAnimated:YES];
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
//    [self dismissModalViewControllerAnimated:YES];
    NSLog(@"取消");
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark- parseSignUp delegate
/*!
 Sent to the delegate to determine whether the sign up request should be submitted to the server.
 @param info a dictionary which contains all sign up information that the user entered.
 @result a boolean indicating whether the sign up should proceed.
 */
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info
{
    NSString *password = info[@"password"];
    BOOL passwordEnable =(BOOL)(password.length >= 8);
    if (!passwordEnable) {
        UIAlertView* alertView =[[UIAlertView alloc] initWithTitle:@"提示" message:@"密码为8～16位" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
//    if (<#condition#>) {
//        <#statements#>
//    }
    return passwordEnable; // prevent sign up if password has to be at least 8 characters long
}

/// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    NSLog(@"注册成功");
   
    [self performSelector:@selector(initLoginViewController)];
}

/// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error
{
    NSLog(@"注册失败");
}

/// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController
{
   [self.navigationController popViewControllerAnimated:YES];
}
@end
