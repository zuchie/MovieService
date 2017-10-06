//
//  DetailsViewTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsViewTests: XCTestCase {

    var output: MockOutput!
    var viewController: DetailsViewController!
	
    override func setUp() {
        super.setUp()

        output = MockOutput()
		
        viewController = DetailsViewController()
        viewController.output = output
        viewController.director = Director()
    }

    override func tearDown() {
        output = nil
        viewController = nil
		
        super.tearDown()
    }

    func testIfViewIsReady() {
        //given
        let mock = MockOutput()

        //when 
        mock.viewIsReady()

        //then
        XCTAssertTrue(mock.viewIsReadyDidCall)
    }
    
    func testIfViewIsPassed() {
        //given
        let mock = MockOutput()
        
        //when
        mock.setViewForSetup(viewController.view)
        
        //then
        XCTAssert(viewController.view === mock.view, "View is not passed to output")
    }
    
    func testIfDataIsPassed() {
        //given
        let mock = MockOutput()
        
        //when
        mock.setData(viewController.director)
        
        // then
        XCTAssert(viewController.director === mock.director, "Data is not passed to output")
    }

    // MARK: - Mock

    class MockOutput: DetailsViewOutput {
        var viewIsReadyDidCall: Bool = false
        var view: UIView!
        var director: Director?

        func viewIsReady() {
            viewIsReadyDidCall = true
        }
        
        func setViewForSetup(_ view: UIView) {
            self.view = view
        }
        
        func setData(_ director: Director?) {
            self.director = director
        }
		
    }
}
