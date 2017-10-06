//
//  DetailsPresenter.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsPresenter: DetailsModuleInput, DetailsViewOutput, DetailsInteractorOutput {

    weak var view: DetailsViewInput!
    var interactor: DetailsInteractorInput!
    var router: DetailsRouterInput!

    // MARK: - DetailsViewOutput
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func setViewForSetup(_ view: UIView) {
        interactor.setViewForSetup(view)
    }
    
    func setData(_ director: Director?) {
        interactor.setData(director)
    }
    
    // MARK: - DetailsInteractorOutput
    
    
    
}
