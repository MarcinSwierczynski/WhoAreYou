//
//  S3Repository
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 09.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "S3Repository.h"
#import "S3RepositoryDelegate.h"
#import "ASIS3ObjectRequest.h"
#import "ASIHTTPRequest.h"
#import "SettingsManager.h"
#import "BaseRepositoryDelegate.h"


@implementation S3Repository {

}
@dynamic delegate;
@synthesize bucketName;


- (id)init {
	self = [super init];
	if (self) {
		[ASIS3Request setSharedAccessKey:[SettingsManager getS3AccessKey]];
		[ASIS3Request setSharedSecretAccessKey:[SettingsManager getS3Secret]];
		self.bucketName = [SettingsManager getS3Bucket];
	}
	return self;
}

- (void)uploadFile:(NSString *)sourcePath to:(NSString *)destinationPath {
	ASIS3ObjectRequest *request = [ASIS3ObjectRequest PUTRequestForFile:sourcePath withBucket:self.bucketName key:destinationPath];
	[request setAccessPolicy:ASIS3AccessPolicyPublicRead];
	[request setDelegate:self];
	[request setDidFinishSelector:@selector(requestUploadFileFinished:)];
	[request setDidFailSelector:@selector(requestS3RepositoryFailed:)];
	[request startAsynchronous];
}


- (void)requestUploadFileFinished:(ASIHTTPRequest *)request {
	if ([self.delegate respondsToSelector:@selector(fileUploadFinished:)]) {
		[self.delegate fileUploadFinished:[request responseString]];
	}
}

- (void)requestS3RepositoryFailed:(ASIHTTPRequest *)request {
	// TODO show pretty message
	NSLog(@"%@", [request error]);
}

- (void)dealloc {
	[bucketName release];
	[super dealloc];
}


@end