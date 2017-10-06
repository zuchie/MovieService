//
//  MoviesListRouter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListRouter.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@implementation MoviesListRouter

- (void)presentDetailsViewController:(UIViewController *)detailsViewController {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController pushViewController:detailsViewController animated:YES];
}

#pragma mark - MoviesListRouterInput

@end
