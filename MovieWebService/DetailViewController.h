//
//  DetailViewController.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TappableLabel.h"
@class Film;

@interface DetailViewController : UIViewController <TappableLabelDelegate>

@property (strong, nonatomic) IBOutlet UILabel *directorName;
@property (strong, nonatomic) IBOutlet UILabel *actorName;
@property (strong, nonatomic) IBOutlet UILabel *actorScreenName;
@property (strong, nonatomic) IBOutlet UILabel *actorNameTitle;
@property (strong, nonatomic) IBOutlet UILabel *actorScreenNameTitle;

@property (strong, nonatomic) TappableLabel *tapToShowMore;

- (void)setData:(id)data;

@end
