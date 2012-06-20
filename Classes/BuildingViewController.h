//
//  BuildingViewController.h
//  MapExperiment
//
//  Created by Loc Phan on 4/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BuildingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *_tableView;
	IBOutlet UILabel *_titleLabel;
	IBOutlet UIImageView *_imageView;
	
	NSMutableArray *departments;
	NSString *titleString;
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) NSMutableArray *departments;
@property (nonatomic, retain) NSString *titleString;;



@end
