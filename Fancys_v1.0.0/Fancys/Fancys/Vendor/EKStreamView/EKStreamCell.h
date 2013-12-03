//
//  EKStreamCell.h
//  StreamView
//
//  Created by miku on 13-11-15.
//  Copyright (c) 2013年 ekohe.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKStreamView.h"
@interface EKStreamCell : UIView<EKResusableCell>
{
    NSString *reuseIdentifier;
}

//@property(nonatomic,strong) UIView *bgView;//背景View
@property(nonatomic,strong) UIImageView* mainImageView;//顶部图片
@property(nonatomic,strong) UILabel*  mainTitle;//名称
#pragma mark-
- (id)initWithFrame:(CGRect)frame  infoViewHeight:(float)infoViewHeight;
@end
