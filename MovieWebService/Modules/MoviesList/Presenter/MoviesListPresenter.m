//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"

@implementation MoviesListPresenter {
    NSArray *films;
}

#pragma mark - Методы MoviesListModuleInput

- (void)configureModule {
 }

#pragma mark - Методы MoviesListViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

- (void)setViewForSetup:(UIView *)view {
    [self.interactor setViewForSetup:view];
}

- (void)setData:(Film *)film {
    films = [NSArray arrayWithObject:film];
    [self.interactor setData:films];
}

#pragma mark - Методы MoviesListInteractorOutput

@end
