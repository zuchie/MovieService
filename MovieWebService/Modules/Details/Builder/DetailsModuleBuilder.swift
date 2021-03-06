//
//  DetailsModuleBuilder.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

@objc class DetailsModuleBuilder: NSObject {

    func build(with data: Any) -> UIViewController? {
        
        let viewController = DetailsViewController()

        let router = DetailsRouter()
        router.viewController = viewController

        let presenter = DetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        guard let film = data as? Film else {
            print("Couldn't get film data")
            return nil
        }
        
        viewController.director = film.director

        return viewController
    }

}
