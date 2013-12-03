//
//  ParseNetwork.m
//  Fancys
//
//  Created by gyc on 11/17/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "ParseNetwork.h"

@implementation ParseNetwork
#pragma mark- test
-(NSArray*)getHomeViewInfo
{
    __block NSArray *objectsArray ;
    // 1
    PFQuery *query = [PFQuery queryWithClassName:@"WallImageObject"];
    
    // 2
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        // 3
        if (!error) {
            objectsArray = objects;
          
        } else {
            // 4
            DLog(@"find Home pageInfo error=%@",[error userInfo][@"error"]);
        }
    }];
    
    return objectsArray;
}
@end
