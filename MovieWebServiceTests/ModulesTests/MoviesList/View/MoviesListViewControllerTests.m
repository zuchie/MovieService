//
//  MoviesListViewControllerTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "MoviesListViewController.h"

#import "MoviesListViewOutput.h"

@interface MoviesListViewControllerTests : XCTestCase

@property (nonatomic, strong) MoviesListViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation MoviesListViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[MoviesListViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(MoviesListViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
    OCMVerify([self.mockOutput setViewForSetup:self.controller.view]);
}

/*
- (void)testThatControllerNotifiesPresenterOnViewWillAppear {
    // given
    //UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [self.controller viewWillAppear:NO];
    //[[UIApplication sharedApplication].keyWindow addSubview:myView];
    
    OCMVerify([self.mockOutput setData:[[Film alloc] initWithData:[[NSDictionary alloc] init]]]);
}
*/

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов MoviesListViewInput

@end
