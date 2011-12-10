//
//  FaceRepository
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 10.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseRepository.h"

@protocol BaseRepositoryDelegate;
@protocol FaceRepositoryDelegate;
@class ASIHTTPRequest;


@interface FaceRepository : BaseRepository {
	NSString *apiKey;
	NSString *apiSecret;
}

@property(nonatomic, assign) NSObject <FaceRepositoryDelegate, BaseRepositoryDelegate> *delegate;
@property(nonatomic, retain) NSString *apiKey;
@property(nonatomic, retain) NSString *apiSecret;


- (void)recognizeFacesIn:(NSString *)photoUrl;

- (void)faceRecognitionRequestFinished:(ASIHTTPRequest *)request;

@end