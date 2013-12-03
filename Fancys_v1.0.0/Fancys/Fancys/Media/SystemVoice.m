//
//  SystemVoice.m
//  Fancys
//
//  Created by gyc on 11/16/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "SystemVoice.h"

@implementation SystemVoice
+ (SystemVoice*)sharedInstance
{
    // 1
    static SystemVoice *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[SystemVoice alloc] init];
    });
    return _sharedInstance;
}


#pragma mark- playSound
- (void)playSoundEffectWithID:(SystemVoiceID)voiceID
{
    switch (voiceID) {
        case kSystemVoiceID_SystemStart:
        {
            [self playSound:@"login_sound0" type:@"wav"];
        }
            break;
            
        default:
        {
            DLog(@"无效SystemVoiceID");
        }
            break;
    }
}
static SystemSoundID shake_sound_male_id = 0;
-(void) playSound:(NSString*)soundName type:(NSString*)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:type];
    if (path) {
        //注册声音到系统
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&shake_sound_male_id);
        AudioServicesPlaySystemSound(shake_sound_male_id);
        //        AudioServicesPlaySystemSound(shake_sound_male_id);//如果无法再下面播放，可以尝试在此播放
    }
    
    AudioServicesPlaySystemSound(shake_sound_male_id);   //播放注册的声音，（此句代码，可以在本类中的任意位置调用，不限于本方法中）
    
    //    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);   //让手机震动
}
@end
