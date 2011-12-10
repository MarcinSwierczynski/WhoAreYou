//
//  BaseRepository
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 09.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "BaseRepository.h"
#import "ASIFormDataRequest.h"


@implementation BaseRepository {

}
@synthesize delegate;


- (void)dealloc {
	delegate = nil;
    [super dealloc];
}

- (ASIHTTPRequest *)createRequest:(NSURL *)url {
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    return request;
}

- (ASIFormDataRequest *)createRequest:(NSURL *)url usingMethod:(NSString *)method {
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	[request setRequestMethod:method];
	[request setDelegate:self];
	return request;
}

@end