//
//  BaseRepositoryDelegate
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 09.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
@protocol BaseRepositoryDelegate

@optional
- (void)requestFinished:(NSString *)result;

- (void)requestFailed:(NSError *)error;

@end