//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractor.h"

#import "MoviesListInteractorOutput.h"
#import "Film.h"
#import "Masonry.h"
#import "AppDelegate.h"
#import "MovieWebService-Swift.h"

@implementation MoviesListInteractor {
    UITableView *tableView;
    NSArray *films;
    UIView *view;
}

- (void)setViewForSetup:(UIView *)view1 {
    view = view1;
    tableView = [UITableView new];
    [view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
}

#pragma mark - MoviesListInteractorInput

- (void)setData:(NSArray *)films1 {
    films = films1;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view);
            make.right.mas_equalTo(view);
            make.top.mas_equalTo(view);
            make.bottom.mas_equalTo(view);
        }];
    });

    [tableView reloadData];
}

- (void)configureCell:(CellTableViewCell *)cell indexPath:(NSIndexPath *)myIndexPath {
    Film *film = [films objectAtIndex:myIndexPath.row];
    cell.name.text = film.name;
  
    NSString* dateText;
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"MMM dd, yyy"];
    [f setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    dateText = [f stringFromDate:film.releaseDate];
  
    cell.date.text = dateText;
  
    NSString *filmRatingText;
    switch (film.filmRating) {
        case G:
        filmRatingText = @"G";
        case PG:
        filmRatingText = @"PG";
        case PG13:
        filmRatingText = @"PG13";
        case R:
        filmRatingText = @"R";
      default:
        break;
    }
    cell.filmRating.text = filmRatingText;
  
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
    NSString *numberString = [formatter stringFromNumber:[NSNumber numberWithFloat:film.rating]];
  
    cell.rating.text = numberString;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return films.count;
}

- (UITableViewCell *)tableView:(UITableView *)myTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellTableViewCell";
    CellTableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CellTableViewCell" owner:self options:nil] firstObject];
    }
  
    [self configureCell:cell indexPath:indexPath];
  
    return cell;
}

- (double)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 67.0;
}

- (void)tableView:(UITableView *)myTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [myTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Film *film = [films objectAtIndex:indexPath.row];
    DetailsModuleBuilder *builder = [DetailsModuleBuilder new];
    
    [self.output presentDetailsViewController:[builder buildWith:film]];
}

@end
