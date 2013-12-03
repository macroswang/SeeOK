//
//  LoginViewController.m
//  Fancys
//
//  Created by gyc on 10/19/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "LoginViewController.h"
#import "ParseLoginViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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
//    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
//    [imageView setImageWithURL:[NSURL URLWithString:@"http://imgstatic.baidu.com/img/image/shouye/zhaoliying0816.jpg"]  placeholderImage:[UIImage imageNamed:@"Spades_Ace.png"]];
//    [self.view  addSubview:imageView];
    
    ParseLoginViewController *logInController = [[ParseLoginViewController alloc] init];
    logInController.delegate = self;
    logInController.fields = PFLogInFieldsUsernameAndPassword
    //    | PFLogInFieldsFacebook
    //    | PFLogInFieldsTwitter
    | PFLogInFieldsLogInButton
    | PFLogInFieldsSignUpButton
    | PFLogInFieldsPasswordForgotten;
    
    
    //    | PFLogInFieldsDismissButton;
    //logInController.facebookPermissions = @[@"friends_about_me"];
    [self presentModalViewController:logInController animated:NO];
}

- (void)viewWillAppear:(BOOL)animated
{


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- parseLogin delegate
- (void)logInViewController:(PFLogInViewController *)controller
               didLogInUser:(PFUser *)user {
//   [self.view.window setRootViewController:[[SceneController sharedInstance] mainRootViewController]];
    DDLogCVerbose(@"deng lu～～～～～～～～～成功==");
 
  
//  [self dismissModalViewControllerAnimated:YES];
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self dismissModalViewControllerAnimated:YES];
}

@end
