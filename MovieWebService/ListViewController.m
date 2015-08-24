//
//  ViewController.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import "ListViewController.h"
#import "MovieCell.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "Film.h"

@interface ListViewController ()

@end

@implementation ListViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    films = [NSArray arrayWithObject:appDelegate.film];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return films.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil];
		cell = self.movieCell;
		self.movieCell = nil;
    }
    [cell setupCell:[films objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    Film *film = [films objectAtIndex:indexPath.row];
    [detailViewController setData:film.director];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
