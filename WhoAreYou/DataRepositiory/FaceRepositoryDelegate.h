//
//  FaceRepositoryDelegate
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 10.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "BaseRepositoryDelegate.h"

@protocol FaceRepositoryDelegate <BaseRepositoryDelegate>

@optional
- (void)faceDetected:(NSString *)response;

@end