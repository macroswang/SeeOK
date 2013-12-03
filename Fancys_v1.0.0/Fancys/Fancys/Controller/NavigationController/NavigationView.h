//
//  NavigationView.h
//  Fancys
//
//  Created by gyc on 11/16/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    kNavigationViewID_Default  =0,
    kNavigationViewID_HomeViewController,//HomeViewController
    kNavigationViewID_MAX,
    
}
NavigationViewID;
@interface NavigationView : UIView

@property (retain, nonatomic) UIButton *navigationLeftBtn;

@property (retain, nonatomic) UIButton *navigationRightBtn;
@property (retain, nonatomic) UILabel *navigationTitleLabel;

-(id)initWitType:(NavigationViewID)typeID;
@end
