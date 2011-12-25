//
//  FaceImage
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 25.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "FaceImageView.h"
#import "RecognitionMetadataView.h"


@implementation FaceImageView {

}

@synthesize imageView;
@synthesize metadataView;


- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		imageView = [[UIImageView alloc] initWithFrame:self.bounds];
		[self addSubview:imageView];

		metadataView = [[RecognitionMetadataView alloc] initWithFrame:imageView.bounds];
		[self addSubview:metadataView];
	}
	return self;
}

- (void)setImage:(UIImage *)anImage {
	[self.imageView setImage:anImage];
}

- (void)dealloc {
	[imageView release];
	[metadataView release];
	[super dealloc];
}


@end