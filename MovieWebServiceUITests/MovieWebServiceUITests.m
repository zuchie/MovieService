//
//  MovieWebServiceUITests.m
//  MovieWebServiceUITests
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>

@class CellTableViewCell;

@interface MovieWebServiceUITests : XCTestCase

@property (nonatomic, strong) XCUIApplication *app;

@end

@implementation MovieWebServiceUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    self.app = [[XCUIApplication alloc] init];
    [self.app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.app = nil;
    
    [super tearDown];
    
}

- (void)testTaps {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    // Force tap, since recording will give "Timestamped Event Matching Error: Failed to find matching element"
    XCUIElementQuery *cells = self.app.tables.cells;
    XCUIElement *cell = cells.allElementsBoundByIndex[0];
    
    [cell tap];
    
    // Verify labels from Details View
    XCUIElementQuery *texts = self.app.staticTexts;
    XCTAssertEqual(texts.allElementsBoundByIndex.count, 4); // 4 labels visible
    
    XCUIElement *element = texts.allElementsBoundByIndex[1];
    NSString *labelText = element.label;
    XCTAssertTrue([labelText isEqualToString:@"Director Name"]);
    element = texts.allElementsBoundByIndex[2];
    labelText = element.label;
    XCTAssertTrue([labelText isEqualToString:@"Ben Affleck"]);
    XCUIElement *tappable = texts.allElementsBoundByIndex[3];
    labelText = tappable.label;
    XCTAssertTrue([labelText isEqualToString:@"Tap here to show more"]);
    
    [tappable tap]; // Tap tappable
    
    XCTAssertEqual(texts.allElementsBoundByIndex.count, 7); // 7 labels visible
    
    labelText = texts.allElementsBoundByIndex[3].label;
    XCTAssertTrue([labelText isEqualToString:@"Actor Name"]);
    labelText = texts.allElementsBoundByIndex[4].label;
    XCTAssertTrue([labelText isEqualToString:@"Bryan Cranston"]);
    labelText = texts.allElementsBoundByIndex[5].label;
    XCTAssertTrue([labelText isEqualToString:@"Actor Screen Name"]);
    labelText = texts.allElementsBoundByIndex[6].label;
    XCTAssertTrue([labelText isEqualToString:@"Jack Donnell"]);
}

@end
