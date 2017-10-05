//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewInput {

    var output: DetailsViewOutput!
    public var director: Director!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
        output.setViewForSetup(self.view)
        output.setData(director)
    }
    
    
    // MARK: DetailsViewInput
    
    func setupInitialState() {
        navigationItem.title = "Details"
        view.backgroundColor = .white
    }


}
