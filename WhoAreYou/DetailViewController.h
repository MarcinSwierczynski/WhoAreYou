//
//  DetailViewController.h
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 09.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "S3RepositoryDelegate.h"
#import "FaceRepositoryDelegate.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, S3RepositoryDelegate, FaceRepositoryDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
