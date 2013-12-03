//
//  ParseSignUpViewController.m
//  Fancys
//
//  Created by gyc on 11/30/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "ParseSignUpViewController.h"

@interface ParseSignUpViewController ()

@end

@implementation ParseSignUpViewController

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
    UILabel* label =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.text = @"Seeok";
    label.backgroundColor =[UIColor clearColor];
    label.textColor =[UIColor whiteColor];
    label.font =[UIFont systemFontOfSize:22];
    [label sizeToFit];
    self.signUpView.logo = label;
    [self.signUpView.signUpButton   setTitle:@"注册" forState:UIControlStateNormal];
    [self.signUpView.signUpButton   setTitle:@"注册" forState:UIControlStateHighlighted];
    
    
    [self.signUpView.usernameField setPlaceholder:@"用户名(长度不能大于6位)"];
    [self.signUpView.passwordField setPlaceholder:@"密码(长度为8～16位)"];
     [self.signUpView.emailField setPlaceholder:@"注册邮箱"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
