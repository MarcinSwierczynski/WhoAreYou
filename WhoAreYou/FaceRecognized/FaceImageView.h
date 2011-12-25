//
//  FaceImage
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 25.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface FaceImageView : UIView

@property(nonatomic, retain) UIImageView *imageView;
@property(nonatomic, retain) UIView *metadataView;

- (void)setImage:(UIImage *)anImage;
@end