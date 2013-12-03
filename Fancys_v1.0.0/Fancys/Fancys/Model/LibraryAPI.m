//
//  LibraryAPI.m
//  Fancys
//
//  Created by gyc on 10/19/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "LibraryAPI.h"
#import "PersistencyManager.h"
#import "NetworkManager.h"

@interface LibraryAPI () {
     PersistencyManager *persistencyManager;//数据层
     NetworkManager *networkManager;//网络层
 
    BOOL isOnline;//是否有网络
}


@end

@implementation LibraryAPI
#pragma mark- init
- (id)init
{
    self = [super init];
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        networkManager = [[NetworkManager alloc] init];
        isOnline = NO;
    
    }
    return self;
}

- (void)dealloc
{
    //移除通知
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


+ (LibraryAPI*)sharedInstance
{
    // 1
    static LibraryAPI *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}

#pragma mark -
@end
