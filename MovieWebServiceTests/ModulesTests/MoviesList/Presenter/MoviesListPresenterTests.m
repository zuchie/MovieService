//
//  MoviesListPresenterTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"

@interface MoviesListPresenterTests : XCTestCase

@property (nonatomic, strong) MoviesListPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation MoviesListPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[MoviesListPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(MoviesListInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(MoviesListRouterInput));
    self.mockView = OCMProtocolMock(@protocol(MoviesListViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов MoviesListModuleInput

#pragma mark - Тестирование методов MoviesListViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

- (void)testThatPresenterPassesViewToInteractor {
    // given
    UIView *view = [[UIView alloc] init];
    
    // when
    [self.presenter setViewForSetup:view];
    
    // then
    OCMVerify([self.mockInteractor setViewForSetup:view]);
    
    view = nil;
}

- (void)testThatPresenterPassesDataToInteractor {
    // given
    Film *film = [[Film alloc] init];
    NSArray *films = [NSArray arrayWithObject:film];
    
    // when
    [self.presenter setData:film];
    
    // then
    OCMVerify([self.mockInteractor setData:films]);
    
    film = nil;
    films = nil;
}

- (void)testThatPresenterPassesDetailsViewControllerToRouter {
    // given
    UIViewController *viewController = [[UIViewController alloc] init];
    
    // when
    [self.presenter presentDetailsViewController:viewController];
    
    // then
    OCMVerify([self.mockRouter presentDetailsViewController:viewController]);
              
    viewController = nil;
}

#pragma mark - Тестирование методов MoviesListInteractorOutput

@end
