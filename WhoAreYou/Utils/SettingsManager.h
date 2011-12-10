//
//  SettingsManager
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 10.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface SettingsManager : NSObject {

}

+ (NSString *)getS3AccessKey;

+ (NSString *)getS3Secret;

+ (NSString *)getS3Bucket;

@end