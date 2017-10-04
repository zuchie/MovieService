//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewInput, TappableLabelDelegate {

    var output: DetailsViewOutput!
    public var director: Director!

    enum Label {
        case directorName(UILabel, CGRect, String, CGFloat)
        case directorNameValue(UILabel, CGRect, String, CGFloat)
        case tapToShowMore(TappableLabel, CGRect, String, CGFloat)
        case actorName(UILabel, CGRect, String, CGFloat)
        case actorNameValue(UILabel, CGRect, String, CGFloat)
        case actorScreenName(UILabel, CGRect, String, CGFloat)
        case actorScreenNameValue(UILabel, CGRect, String, CGFloat)
    }
    
    
    var labels: [UILabel]!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        view = UIView()
        view.backgroundColor = .white
        
        let labelTextSize: CGFloat = 18.0
        let labelValueTextSize: CGFloat = 15.0
        let labelFrame = CGRect(x: 20, y: 100, width: 200, height: 30)

        let actor: Actor = director.film.cast[0]
        
        labels = [
                Label.directorName(UILabel(), labelFrame, "Director Name", labelTextSize),
                Label.directorNameValue(UILabel(), labelFrame.offsetBy(dx: 0, dy: 50), director.name, labelValueTextSize),
                Label.tapToShowMore(TappableLabel(), labelFrame.offsetBy(dx: 0, dy: 120), "Tap here to show more", labelTextSize),
                Label.actorName(UILabel(), labelFrame.offsetBy(dx: 0, dy: 170), "Actor Name", labelTextSize),
                Label.actorNameValue(UILabel(), labelFrame.offsetBy(dx: 0, dy: 220), actor.name, labelValueTextSize),
                Label.actorScreenName(UILabel(), labelFrame.offsetBy(dx: 0, dy: 270), "Actor Screen Name", labelTextSize),
                Label.actorScreenNameValue(UILabel(), labelFrame.offsetBy(dx: 0, dy: 320), actor.screenName, labelValueTextSize)
            ]
            .map(makeALabel)
            
            labels.forEach { self.view.addSubview($0) }
    }

    // MARK: Helpers
    
    func makeALabel(_ label: Label) -> UILabel {
        func makeLabel(_ label: UILabel, _ frame: CGRect, _ text: String, _ fontSize: CGFloat) -> UILabel {
            let label = label
            label.frame = frame
            label.text = text
            label.font = label.font.withSize(fontSize)
            
            return label
        }
        
        switch label {
        case let .directorName(label, frame, text, fontSize):
            return makeLabel(label, frame, text, fontSize)
        case let .directorNameValue(label, frame, text, fontSize):
            return makeLabel(label, frame, text, fontSize)
        case let .tapToShowMore(label, frame, text, fontSize):
            label.delegate = self
            return makeLabel(label, frame, text, fontSize)
        case let .actorName(label, frame, text, fontSize):
            label.isHidden = true
            return makeLabel(label, frame, text, fontSize)
        case let .actorNameValue(label, frame, text, fontSize):
            label.isHidden = true
            return makeLabel(label, frame, text, fontSize)
        case let .actorScreenName(label, frame, text, fontSize):
            label.isHidden = true
            return makeLabel(label, frame, text, fontSize)
        case let .actorScreenNameValue(label, frame, text, fontSize):
            label.isHidden = true
            return makeLabel(label, frame, text, fontSize)
        }
    }
    
    
    // MARK: DetailsViewInput

    func didReceiveTouch() {
        labels[3..<labels.count].forEach { $0.isHidden = false }
    }
    
    func setupInitialState() {
        navigationItem.title = "DetailsViewController"
        view.backgroundColor = .white
    }


}
