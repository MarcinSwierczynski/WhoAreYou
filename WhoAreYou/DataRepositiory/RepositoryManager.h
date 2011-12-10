//
//  RepositoryManager
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 10.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import <Foundation/Foundation.h>

@class S3Repository;


@interface RepositoryManager : NSObject {
	S3Repository *s3Repository;
}
@property(nonatomic, retain) S3Repository *s3Repository;

+ (RepositoryManager *)repository;

@end