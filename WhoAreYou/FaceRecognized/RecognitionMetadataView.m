//
//  RecognitionMetadataView
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 25.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import "RecognitionMetadataView.h"


@implementation RecognitionMetadataView {

}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.opaque = NO;
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextSetLineWidth(context, 2.0);

	CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
	CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
	CGColorRef color = CGColorCreate(colorspace, components);
	CGContextSetStrokeColorWithColor(context, color);

	CGContextMoveToPoint(context, 23.43, 27.59);
	CGContextAddLineToPoint(context, 40.5,  31.91);

	CGContextStrokePath(context);
	CGColorSpaceRelease(colorspace);
	CGColorRelease(color);
}


@end