//
//  MovieCell.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import "MovieCell.h"
#import "Film.h"

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupCell:(Film *)film {
    self.name.text = film.name;

    NSCalendar* cal = [NSCalendar new];
    NSString* dateText;
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setCalendar:cal];
    dateText = [f stringFromDate:film.releaseDate];

    self.date.text = dateText;
    
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
    self.filmRating.text =filmRatingText;
    self.rating.text = [[NSNumber numberWithInteger:film.rating] stringValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
