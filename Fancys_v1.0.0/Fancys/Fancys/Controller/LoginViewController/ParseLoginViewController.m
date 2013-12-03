//
//  ParseLoginViewController.m
//  Fancys
//
//  Created by gyc on 11/12/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "ParseLoginViewController.h"

@interface ParseLoginViewController ()

@end

@implementation ParseLoginViewController

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
//    self.view.backgroundColor = [UIColor colorWithPatternImage:
//                                 [UIImage imageNamed:@"myBackgroundImage.png"]];
    UILabel* label =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
     label.text = @"Seeok";
    label.backgroundColor =[UIColor clearColor];
    label.textColor =[UIColor whiteColor];
    label.font =[UIFont systemFontOfSize:22];
    [label sizeToFit];
    self.logInView.logo = label;
    
    
    
    
//    [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]]];
//    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];
    
//    [self.logInView.passwordForgottenButton setTitle:@"忘记了" forState:UIControlStateNormal];
//      [self.logInView.passwordForgottenButton setTitle:@"忘记了" forState:UIControlStateHighlighted];
//    [self.logInView.logInButton   setTitle:@"登陆" forState:UIControlStateNormal];
//     [self.logInView.logInButton  setTitle:@"登陆" forState:UIControlStateHighlighted];
    
    
//    [self.logInView.passwordForgottenButton removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
//    [self.logInView.passwordForgottenButton addTarget:self action:@selector(findPassword) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Set frame for elements
    [self.logInView.logInButton setFrame:CGRectMake(35.0f, 200.0f, 250.0f, 40.0f)];
     [self.logInView.logInButton   setTitle:@"登陆" forState:UIControlStateNormal];
   [self.logInView.logInButton  setTitle:@"登陆" forState:UIControlStateHighlighted];
//    [self.logInView.logo setFrame:CGRectMake(66.5f, 70.0f, 187.0f, 58.5f)];
//    [self.logInView.facebookButton setFrame:CGRectMake(35.0f, 287.0f, 120.0f, 40.0f)];
//    [self.logInView.twitterButton setFrame:CGRectMake(35.0f+130.0f, 287.0f, 120.0f, 40.0f)];
//    [self.logInView.signUpButton setFrame:CGRectMake(35.0f, 385.0f, 250.0f, 40.0f)];
//    [self.logInView.usernameField setFrame:CGRectMake(35.0f, 145.0f, 250.0f, 50.0f)];
//    [self.logInView.passwordField setFrame:CGRectMake(35.0f, 195.0f, 250.0f, 50.0f)];
   [self.logInView.passwordForgottenButton setFrame:CGRectMake(35.0f, 250.0f, 250.0f, 40.0f)];
     [self.logInView.passwordForgottenButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.logInView.passwordForgottenButton   setTitle:@"忘记了密码?" forState:UIControlStateNormal];
    [self.logInView.passwordForgottenButton  setTitle:@"忘记了密码?" forState:UIControlStateHighlighted];
    [self.logInView.passwordForgottenButton  setBackgroundImage:nil forState:UIControlStateNormal];
    [self.logInView.passwordForgottenButton  setBackgroundImage:nil forState:UIControlStateHighlighted];
    
   
    [self.logInView.usernameField setPlaceholder:@"用户名"];
     [self.logInView.passwordField setPlaceholder:@"密码"];
    
    
  
}
#pragma mark- 找回密码
- (void) findPassword
{
    NSLog(@"找回密码！！！！");
    
}
@end
