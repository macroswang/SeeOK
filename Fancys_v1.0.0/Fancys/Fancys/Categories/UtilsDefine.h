//
//  UtilsDefine.h
//  Fancys
//
//  Created by gyc on 11/16/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#ifndef Fancys_UtilsDefine_h
#define Fancys_UtilsDefine_h


#pragma mark-LOG
///////////////////////////////////////LOG////////////////////////////////////////////////////////////
#ifdef DEBUG
#   define DLog(fmt, ...) DDLogCVerbose((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif



#pragma mark- DEVER
///////////////////////////////////////DEVER////////////////////////////////////////////////////////////
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)//是否是高清
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)//是否是IPHONE5
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)//是否是IPAD
#define NavigationBar_HEIGHT 44 //导航高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)//屏幕宽度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//屏幕高度
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]//ios版本
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])//当前版本
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])//当前语音


#pragma mark- GCD
///////////////////////////////////////GCD////////////////////////////////////////////////////////////
#define AS_DISPATCH_GLOBAL_BLOCK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)//全局队列异步
#define AS_DISPATCH_MAIN_BLOCK(block) dispatch_async(dispatch_get_main_queue(),block)//主线程队列异步




#pragma mark- NSUserDefaults
///////////////////////////////////////NSUserDefaults////////////////////////////////////////////////////////////
#define USER_DEFAULT [NSUserDefaults standardUserDefaults] //用户存储
//#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]





#pragma mark- math
///////////////////////////////////////math///////////////////////////////////////////////////////////
#pragma mark - degrees/radian functions
#define degreesToRadian(x) (M_PI * (x) / 180.0)//角度转换成弧度
#define radianToDegrees(radian) (radian*180.0)/(M_PI)//弧度转换成角度






#pragma mark - color functions
///////////////////////////////////////color//////////////////////////////////////////////////////////
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]//RGB颜色
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]//RGB颜色 透明度
#define RGBIMAGENAMECOLOR(imageName) [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]]
#define RGBIMAGECOLOR(image) [UIColor colorWithPatternImage:image]



#endif
