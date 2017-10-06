//
//  DetailsPresenterTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//


import XCTest

@testable
import MovieWebService

class DetailsPresenterTests: XCTestCase {

    var presenter: DetailsPresenter!
    var router: MockRouter!
    var interactor: MockInteractor!
    var view: MockView!
	
    override func setUp() {
        super.setUp()
		
        router = MockRouter()
        interactor = MockInteractor()
        view = MockView()

        presenter = DetailsPresenter()
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
    }

    override func tearDown() {
        router = nil
        interactor = nil
        view = nil
        presenter = nil

        super.tearDown()
    }
    
    func testIfViewIsReady() {
        // given
        
        // when
        self.presenter.viewIsReady()
        
        // then
        XCTAssertTrue(view.initialStateIsSetup)
    }
    
    func testIfViewIsPassedToInteractor() {
        // given
        let view = UIView()
        
        // when
        self.presenter.setViewForSetup(view)
        
        // then
        XCTAssert(view === interactor.view, "View is not passed to interactor")
    }
    
    func testIfDirectorIsPassedToInteractor() {
        // given
        let director: Director? = Director()
        
        // when
        self.presenter.setData(director)
        
        // then
        XCTAssert(director === interactor.director, "Data is not passed to interactor")
    }

    // MARK: - Mock

    class MockInteractor: DetailsInteractorInput {
        var view: UIView!
        var director: Director?
        
        func setViewForSetup(_ view: UIView) {
            self.view = view
        }
        
        func setData(_ data: Director?) {
            director = data
        }

    }

    class MockRouter: DetailsRouterInput {

    }

    class MockView: DetailsViewInput {
        var initialStateIsSetup = false
		
        func setupInitialState() {
            initialStateIsSetup = true
        }
    }

}
