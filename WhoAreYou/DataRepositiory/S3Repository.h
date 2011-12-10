//
//  S3Repository
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 09.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseRepository.h"

@protocol S3RepositoryDelegate;
@class ASIHTTPRequest;
@protocol BaseRepositoryDelegate;


@interface S3Repository : BaseRepository {
	NSString *bucketName;
}

@property(nonatomic, assign) NSObject <S3RepositoryDelegate, BaseRepositoryDelegate> *delegate;
@property(nonatomic, retain) NSString *bucketName;

- (void)uploadFile:(NSString *)sourcePath to:(NSString *)destinationPath;

- (void)requestUploadFileFinished:(ASIHTTPRequest *)request;

-(void)requestS3RepositoryFailed:(ASIHTTPRequest *)request;

@end