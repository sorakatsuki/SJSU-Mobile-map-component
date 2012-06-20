//
//  BuildingViewController.m
//  MapExperiment
//
//  Created by Loc Phan on 4/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "BuildingViewController.h"
#import "DepartmentViewController.h"

@implementation BuildingViewController

@synthesize titleLabel = _titleLabel;
@synthesize tableView = _tableView;
@synthesize imageView = _imageView;
@synthesize departments;
@synthesize titleString;

- (void)dealloc {
    [super dealloc];
	[titleString release];
	[_titleLabel release];
	[_tableView release];
	[_imageView release];
	[departments release];
}

- (void)viewDidLoad {
    [super viewDidLoad];	
	self.titleLabel.text = titleString;
	self.tableView.tableHeaderView.hidden = YES;
}



#pragma mark -
#pragma mark UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellID = @"Cell";
	UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellID];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID] autorelease];
		
		NSDictionary *department = [departments objectAtIndex:indexPath.row];
		
		cell.textLabel.text = [NSString stringWithString:[department objectForKey:@"name"]];
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [departments count];
}


#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	DepartmentViewController *department = [[DepartmentViewController alloc] init];
	
	department.data = [departments objectAtIndex:indexPath.row];
	
	[self.navigationController pushViewController:department animated:YES];
	[department release];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}


@end
