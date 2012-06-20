//
//  RootViewController.h
//  SJSU Map
//
//  Created by Alben Cheung on 3/6/10.
//  Copyright San Jose State University 2010. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, UISearchBarDelegate, 
UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate> 
{
	//Map View
	MKMapView *sjsuMap;
	
	//Search
	UISearchBar *_searchBar;
	UITableView *_tableView;
	
	//Table Arrays
	NSArray *buildingMapData;
	NSMutableDictionary *titleToAbbreviation;
	NSMutableDictionary *abbrToDataObject;
	NSMutableDictionary *abbreviationToTitle;
	
	//Search Bar Content
	NSMutableArray *searchDB;
	NSMutableArray *dbTemp;
	BOOL isSearching;
}

@property (nonatomic, retain) UISearchBar *searchBar;
@property (nonatomic, retain) UITableView *tableView;

-(IBAction)loadCampusMap:(id)sender;

@end
