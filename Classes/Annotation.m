//
//  Annotation.m
//  MapExperiment
//
//  Created by Loc Phan on 2/21/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "Annotation.h"


@implementation Annotation

@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)newCoordinate addressDictionary:(NSDictionary *)newAddressDictionary {
	
	if ((self = [super initWithCoordinate:newCoordinate addressDictionary:newAddressDictionary])) {
		_coordinate = newCoordinate;		
	}
	return self;
}
- (void)dealloc {
	[_subtitle release];
	[_title release];
	[super dealloc];
}

@end
