//
//  SettingsManager
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 10.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "SettingsManager.h"


@implementation SettingsManager {

}

+ (NSDictionary *)settingsAsDict {
	NSString *pathForSettingPlist = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"];
	NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:pathForSettingPlist];
	return settings;
}

+ (NSString *)getS3AccessKey {
	return [[SettingsManager settingsAsDict] objectForKey:@"s3AccessKey"];
}

+ (NSString *)getS3Secret {
	return [[SettingsManager settingsAsDict] objectForKey:@"s3Secret"];
}

+ (NSString *)getS3Bucket {
	return [[SettingsManager settingsAsDict] objectForKey:@"s3Bucket"];
}

+ (NSString *)getFaceKey {
	return [[SettingsManager settingsAsDict] objectForKey:@"faceKey"];
}

+ (NSString *)getFaceSecret {
	return [[SettingsManager settingsAsDict] objectForKey:@"faceSecret"];
}


@end