//
//  NavigationView.m
//  Fancys
//
//  Created by gyc on 11/16/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "NavigationView.h"

@implementation NavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initWitType:(NavigationViewID)typeID
{

 
     self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NavigationBar_HEIGHT)];
    if (self) {
     
        //设置导航条阴影
        [self.layer setShadowOpacity:0.45f];
        [self.layer  setShadowRadius:5.0f];
        [self.layer  setShadowColor:[[UIColor blackColor] CGColor]];
        [self.layer   setShadowOffset:CGSizeMake(2.0f, 2.0f)] ;
       //设置背景
        [self setBackgroundColor:RGBACOLOR(204.0f, 50.0f, 75.0f, 1.0f)];
        UIImage* bgImage =[UIImage imageNamed:@"navigationView_background.png"];
        UIImageView* navigationBGImageView =[[UIImageView alloc] initWithFrame:self.frame];
        [navigationBGImageView setImage:bgImage];
        [self addSubview:navigationBGImageView];
        
        switch (typeID) {
            case kNavigationViewID_Default:
            {
            
            }
                break;
            case kNavigationViewID_HomeViewController:
            {
                //左边按钮
                 self.navigationLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 54, 44)];
                [self.navigationLeftBtn setImage:[UIImage imageNamed:@"navigationView_LeftBtn.png"] forState:UIControlStateNormal];
                [self.navigationLeftBtn setImage:[UIImage imageNamed:@"navigationView_LeftBtn_h.png"] forState:UIControlStateHighlighted];
                [self addSubview:self.navigationLeftBtn];
                
                //导航标题
                
                self.navigationTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 140, 44)];
                [ self.navigationTitleLabel  setFont:[UIFont systemFontOfSize:20]];
                [ self.navigationTitleLabel  setTextAlignment:NSTextAlignmentCenter];
                [ self.navigationTitleLabel  setTextColor:[UIColor blackColor]];
                [ self.navigationTitleLabel  setBackgroundColor:[UIColor clearColor]];
                [self addSubview: self.navigationTitleLabel ];

                
            }
                break;
                
                
            default:
                break;
        }
        
        
    }
    return self;
}
@end
