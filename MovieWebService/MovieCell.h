//
//  MovieCell.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <UIKit/UIKit.h>

@class Film;

@interface MovieCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *filmRating;
@property (strong, nonatomic) IBOutlet UILabel *rating;

- (void)setupCell:(Film *)film;

@end
