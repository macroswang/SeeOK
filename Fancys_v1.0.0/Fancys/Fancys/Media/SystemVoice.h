//
//  SystemVoice.h
//  Fancys
//
//  Created by gyc on 11/16/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>
 #import <AudioToolbox/AudioToolbox.h>
//声音ID
typedef enum
{
    kSystemVoiceID_Default  =0,
     kSystemVoiceID_SystemStart,//开机声音
    kSystemVoiceID_Login,//登陆声音
    kSystemVoiceID_MAX,
   
}
SystemVoiceID;


@interface SystemVoice : NSObject
#pragma mark- init
+ (SystemVoice*)sharedInstance;
#pragma mark- Play Sound
- (void)playSoundEffectWithID:(SystemVoiceID)voiceID;
@end
