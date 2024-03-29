//
//  DetailViewController.m
//  WhoAreYou
//
//  Created by Marcin Swierczynski on 09.12.2011.
//  Copyright (c) 2011 marcin@swierczynski.net. All rights reserved.
//

#import "DetailViewController.h"
#import "RepositoryManager.h"
#import "S3Repository.h"
#import "FaceRepository.h"
#import "JSONKit.h"
#import "FaceImageView.h"

@interface DetailViewController ()
@property(strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;
@end

@implementation DetailViewController

@synthesize masterPopoverController = _masterPopoverController;
@synthesize imageView;


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
	// Update the view.
	[self configureView];

	if (self.masterPopoverController != nil) {
		[self.masterPopoverController dismissPopoverAnimated:YES];
	}
}

- (void)configureView {
	// Update the user interface for the detail item.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)viewDidUnload {
	[super viewDidUnload];
	self.imageView = nil;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
	[[RepositoryManager repository].s3Repository setDelegate:self];
	[[RepositoryManager repository].s3Repository uploadFile:sourcePath to:@"image.jpg"];

	[self showImage:sourcePath];

	[[RepositoryManager repository].faceRepository setDelegate:self];
	[[RepositoryManager repository].faceRepository recognizeFacesIn:@"http://whoareyou.s3.amazonaws.com/image.jpg"];
}

- (void)fileUploadFinished:(NSString *)response {
	NSLog(@"Upload successful! Response: '%@'", response);
}

- (void)faceDetected:(NSString *)response {
	NSLog(@"Faces detected! Response: '%@'", [response objectFromJSONString]);
}

- (void)showImage:(NSString *)imagePath {
	[imageView setImage:[UIImage imageWithContentsOfFile:imagePath]];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
		return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
		return YES;
	}
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController {
	barButtonItem.title = NSLocalizedString(@"Master", @"Master");
	[self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
	self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
	// Called when the view is shown again in the split view, invalidating the button and popover controller.
	[self.navigationItem setLeftBarButtonItem:nil animated:YES];
	self.masterPopoverController = nil;
}

- (void)dealloc {
	[imageView release];
	[super dealloc];
}


@end
