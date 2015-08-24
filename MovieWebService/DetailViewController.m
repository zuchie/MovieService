//
//  DetailViewController.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import "DetailViewController.h"
#import "Film.h"
#import "Director.h"
#import "Actor.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tapToShowMore = [[TappableLabel alloc] initWithFrame:CGRectMake(20.0f, 78.0f, 280.0f, 44.0f)];
    self.tapToShowMore.font = [UIFont systemFontOfSize:14.0f];
    self.tapToShowMore.delegate = self;
    self.tapToShowMore.text = @"Tap here to show more";
    [self.view addSubview:self.tapToShowMore];
}

- (void)setData:(id)data {
    Director *director = (Director*)data;
    self.directorName.text = director.name;
    Actor *actor = (Actor *)[director.film.cast objectAtIndex:0];
    if (actor) {
        self.actorName.text = actor.name;
        self.actorScreenName.text = actor.screenName;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveTouches {
    self.tapToShowMore.hidden = YES;
    self.actorName.hidden = NO;
    self.actorScreenName.hidden = NO;
    self.actorNameTitle.hidden = NO;
    self.actorScreenNameTitle.hidden = NO;
}

@end
