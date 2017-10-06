//
//  DetailsViewOutput.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

protocol DetailsViewOutput {

    func viewIsReady()
    func setViewForSetup(_ view: UIView)
    func setData(_ director: Director?)

}
