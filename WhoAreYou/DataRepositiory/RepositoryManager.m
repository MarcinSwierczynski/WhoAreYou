//
//  RepositoryManager
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 10.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "RepositoryManager.h"
#import "S3Repository.h"


@implementation RepositoryManager {

}
@synthesize s3Repository;

static RepositoryManager *repository;

+ (RepositoryManager *)repository {
	@synchronized (self) {
		if (repository == nil) {
			repository = [[self alloc] init];
		}
	}
	return repository;
}

- (id)init {
	self = [super init];
	if (self) {
		s3Repository = [[S3Repository alloc] init];
	}
	return self;
}


- (void)dealloc {
	[s3Repository release];
	[super dealloc];
}

@end