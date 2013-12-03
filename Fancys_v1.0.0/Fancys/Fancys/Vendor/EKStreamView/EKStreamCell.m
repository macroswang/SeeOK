//
//  EKStreamCell.m
//  StreamView
//
//  Created by miku on 13-11-15.
//  Copyright (c) 2013年 ekohe.com. All rights reserved.
//

#import "EKStreamCell.h"
#import <QuartzCore/QuartzCore.h>

////图片底部信息栏高度
//const CGFloat  kViewInfoHeight  =50.0f;

//设置边框的宽度，当然可以不要
const CGFloat kViewBorderMargin = 2.0f;
//设置圆角的有多圆
const CGFloat kViewCornerRadius = 5.0f;

//设置边据
const CGFloat kViewPadingWidth =0.0f;

@implementation EKStreamCell
@synthesize reuseIdentifier;
//@synthesize bgView;
@synthesize mainImageView;

- (id)initWithFrame:(CGRect)frame  infoViewHeight:(float)infoViewHeight
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self  setBackgroundColor:[UIColor whiteColor]];
        //初始化背景
//        CGRect bgFrame = CGRectInset(self.bounds, 10.0f, 10.0f);
//        self.bgView = [[UIView alloc] initWithFrame:bgFrame];
//        self.bgView .layer.borderColor = [[UIColor whiteColor] CGColor];//设置边框的颜色
//        self.bgView .layer.borderWidth = kViewBorderMargin;//设置边框的宽度，当然可以不要
//       
//        self.bgView .autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        
//        [self.bgView setBackgroundColor:[UIColor blueColor]];
//        
//          [self addSubview:self.bgView];
        //设置圆角
        self.layer.cornerRadius = kViewCornerRadius;//设置圆角的有多圆
        self.layer.masksToBounds = YES;//设为NO去试试
        
     
//        NSLog(@"打印图片高度====width=%f  heitht==%f",bgFrame.size.width,bgFrame.size.height);
        //topImage
        CGRect  imageRect =CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height-infoViewHeight);
          CGRect  topImageFrame = CGRectInset(imageRect, 0.0f, 0.0f);
          self.mainImageView =[[UIImageView alloc] initWithFrame:topImageFrame];
//       self.mainImageView .center = CGPointMake(self.frame.size.width/ 2, 0);
       self.mainImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.mainImageView setContentMode:UIViewContentModeScaleAspectFit];
//        [self.mainImageView setImage:[UIImage imageNamed:@"1.jpeg"]];
        
        [self.mainImageView setBackgroundColor:RGBACOLOR(134.0f, 135.0f, 146.0f, 1)];
        [self addSubview: self.mainImageView];
        
        
         CGRect bgFrame = CGRectInset(self.bounds, 0.0f, 0.0f);
        self.mainTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bgFrame.size.width, 20)];
         self.mainTitle.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.85);
         self.mainTitle.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
         self.mainTitle.backgroundColor = [UIColor clearColor];
         self.mainTitle.textAlignment = UITextAlignmentCenter;
        self.mainTitle.textColor =RGBACOLOR(134.0f, 135.0f, 146.0f, 1);
         [self addSubview: self.mainTitle];
        
        
        
       
        
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

@end
