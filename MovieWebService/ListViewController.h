//
//  ViewController.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovieCell;

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *films;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet MovieCell *movieCell;

@end
