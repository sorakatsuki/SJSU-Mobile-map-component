//
//  DepartmentViewController.m
//  MapExperiment
//
//  Created by Loc Phan on 4/23/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "DepartmentViewController.h"
#import "WebsiteViewController.h"


@implementation DepartmentViewController

@synthesize tableView = _tableView;
@synthesize data;

- (void)dealloc {
    [super dealloc];
	[_tableView release];
	[data release];
	[displayStrings release];
	 
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = [data objectForKey:@"name"];
	displayStrings = [[NSMutableArray alloc] init];
}
   

#pragma mark -
#pragma mark UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellID = @"Cell";
	UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellID];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellID] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
	}
	
	NSString *key = [displayStrings objectAtIndex:indexPath.section];
	if ([key isEqualToString:@"phone"]) {
		cell.textLabel.text = @"Main";
		NSString *phonenumber = [data objectForKey:key];
		NSString *areacode = [phonenumber substringToIndex:3];
		NSRange range;
		range.length = 3;
		range.location = 3;
		NSString *number1 = [phonenumber substringWithRange:range];
		range.length = 4;
		range.location = 6;
		NSString *number2 = [phonenumber substringWithRange:range];
		cell.detailTextLabel.text = [NSString stringWithFormat:@"(%@) %@-%@",areacode,number1,number2];
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	}
	if ([key isEqualToString:@"email"]) {
		cell.textLabel.text = @"Email";
		cell.detailTextLabel.text = [data objectForKey:key];
	}	
	if ([key isEqualToString:@"url"]) {
		cell.textLabel.text = @"Website";
		cell.detailTextLabel.text = [data objectForKey:key];
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	}
	if ([key isEqualToString:@"floor"]) {
		cell.textLabel.text = @"Floor";
		cell.detailTextLabel.text = [data objectForKey:key];
	}

	
	
	return cell;
	
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	int count = 0;
	for (NSString *key in [data allKeys]) {
		NSString *string = [data objectForKey:key];
		if (![string isEqualToString:@""]) {
			if ([key isEqualToString:@"zip"]) {
				continue;
			}
			count++;
			[displayStrings addObject:key];
		}
	}
	return count-2;
}
#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	NSString *text = cell.textLabel.text;
	
	if ([text isEqualToString:@"Website"]) {
		WebsiteViewController *website = [[WebsiteViewController alloc] init];
		website.webLink = [data objectForKey:@"url"];
		[self.navigationController pushViewController:website animated:YES];
		[website release];
	}
	else if([text isEqualToString:@"phone"]) {
		phoneNum = [data objectForKey:@"phone"];
		NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phoneNum]];
		[[UIApplication sharedApplication] openURL:url];
	}

	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
