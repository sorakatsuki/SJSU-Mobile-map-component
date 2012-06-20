//
//  WebsiteViewController.m
//  MapExperiment
//
//  Created by Alben Cheung on 4/29/10.
//  Copyright 2010 San Jose State University. All rights reserved.
//

#import "WebsiteViewController.h"

@implementation WebsiteViewController

@synthesize webView;
@synthesize webLink;


- (void)viewDidLoad {
	NSString *urlAddress = webLink;
 
	//Create a URL object.
	NSURL *url = [NSURL URLWithString:urlAddress];
 
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
 
	//Load the request in the UIWebView.
	[webView loadRequest:requestObj];
    [super viewDidLoad];
}

- (void)dealloc {
	[webView release];
	[webLink release];
    [super dealloc];
}


@end
