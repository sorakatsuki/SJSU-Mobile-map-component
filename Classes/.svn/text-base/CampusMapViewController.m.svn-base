//
//  CampusMapViewController.m
//  MapExperiment
//
//  Created by Alben Cheung on 4/29/10.
//  Copyright 2010 San Jose State University. All rights reserved.
//

#import "CampusMapViewController.h"


@implementation CampusMapViewController

@synthesize sCMap;


-(IBAction) btnReturn:(id) sender{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad {
	CGRect scrollFrame = CGRectMake(0, 43, 320, 480);
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollFrame];
	scrollView.minimumZoomScale = 0.2;
	scrollView.maximumZoomScale = 4.0;
	scrollView.delegate = self;
	
	UIImage *campusMap = [UIImage imageNamed:@"Static_Campus_Map.jpg"];
	sCMap = [[UIImageView alloc] initWithImage:campusMap];
	
	[scrollView addSubview:sCMap];
	scrollView.contentSize = sCMap.frame.size;
	scrollView.zoomScale = 0.5;
	CGFloat tempx = sCMap.center.x - (scrollView.bounds.size.width/2);
	CGFloat tempy = sCMap.center.y - (scrollView.bounds.size.height/2);
	CGPoint myScrollViewOffset = CGPointMake( tempx, tempy);
	scrollView.contentOffset = myScrollViewOffset;
	
	[self.view addSubview:scrollView];
	[scrollView release];
    [super viewDidLoad];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
	return sCMap;
}

- (void)dealloc {
    [super dealloc];
	[sCMap release];
}


@end
