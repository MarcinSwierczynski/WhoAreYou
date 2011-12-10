//
//  BaseRepository
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 09.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol BaseRepositoryDelegate;
@class ASIHTTPRequest;
@class ASIFormDataRequest;


@interface BaseRepository : NSObject {
}
@property(nonatomic, assign) NSObject <BaseRepositoryDelegate> *delegate;

- (ASIHTTPRequest *)createRequest:(NSURL *)url;

- (ASIFormDataRequest *)createRequest:(NSURL *)url usingMethod:(NSString *)method;

@end