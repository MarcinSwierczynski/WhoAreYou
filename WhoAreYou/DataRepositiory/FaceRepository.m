//
//  FaceRepository
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 10.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "FaceRepository.h"
#import "ASIHTTPRequest.h"
#import "SettingsManager.h"
#import "FaceRepositoryDelegate.h"


@implementation FaceRepository {

}
@dynamic delegate;
@synthesize apiKey;
@synthesize apiSecret;

- (id)init {
	self = [super init];
	if (self) {
		self.apiKey = [SettingsManager getFaceKey];
		self.apiSecret = [SettingsManager getFaceSecret];
	}
	return self;
}


- (void)recognizeFacesIn:(NSString *)photoUrl {
	NSString *url = [NSString stringWithFormat:@"http://api.face.com/faces/detect.json?api_key=%@&api_secret=%@&urls=%@&attributes=all&",
											   self.apiKey, self.apiSecret, photoUrl];
	ASIHTTPRequest *request = [super createRequest:[NSURL URLWithString:url]];
	[request setDidFinishSelector:@selector(faceRecognitionRequestFinished:)];
}

- (void)faceRecognitionRequestFinished:(ASIHTTPRequest *)request {
	if ([self.delegate respondsToSelector:@selector(faceDetected:)]) {
		[self.delegate faceDetected:[request responseString]];
	}
}

- (void)dealloc {
	[apiKey release];
	[apiSecret release];
	[super dealloc];
}

@end