//
//  S3RepositoryDelegate
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 09.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "BaseRepositoryDelegate.h"

@protocol S3RepositoryDelegate <BaseRepositoryDelegate>

@optional
- (void)fileUploadFinished:(NSString *)response;

@end