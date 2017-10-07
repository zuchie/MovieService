//
//  DetailsInteractor.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsInteractor: NSObject, DetailsInteractorInput, TappableLabelDelegate {

    weak var output: DetailsInteractorOutput!
    var view: UIView!
    
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

    let labelTextSize: CGFloat = 18.0
    let labelValueTextSize: CGFloat = 15.0
    let labelFrame = CGRect(x: 20, y: 100, width: 200, height: 30)

    // MARK: - DetailsInteractorInput
    
    func setViewForSetup(_ view: UIView) {
        self.view = view
    }
    
    func setData(_ data: Director?) {
        guard let director = data, !director.film.cast.isEmpty else {
            print("Invalid director data")
            return
        }
        
        let actor = director.film.cast[0]
        
        labels = [
            Label.directorName(UILabel(),
                               labelFrame,
                               "Director Name",
                               labelTextSize),
            Label.directorNameValue(UILabel(),
                                    labelFrame.offsetBy(dx: 0, dy: 50),
                                    director.name ?? "Unknown director name",
                                    labelValueTextSize),
            Label.tapToShowMore(TappableLabel(),
                                labelFrame.offsetBy(dx: 0, dy: 120),
                                "Tap here to show more",
                                labelTextSize),
            Label.actorName(UILabel(),
                            labelFrame.offsetBy(dx: 0, dy: 120),
                            "Actor Name",
                            labelTextSize),
            Label.actorNameValue(UILabel(),
                                 labelFrame.offsetBy(dx: 0, dy: 170),
                                 actor.name ?? "Unknown actor name",
                                 labelValueTextSize),
            Label.actorScreenName(UILabel(),
                                  labelFrame.offsetBy(dx: 0, dy: 220),
                                  "Actor Screen Name",
                                  labelTextSize),
            Label.actorScreenNameValue(UILabel(),
                                       labelFrame.offsetBy(dx: 0, dy: 270),
                                       actor.screenName ?? "Unknown actor screen name",
                                       labelValueTextSize)
            ]
            .map(makeALabel)
        
        labels.forEach { self.view.addSubview($0) }
        
    }
    
    
    // MARK: Helpers
    
    private func makeALabel(_ label: Label) -> UILabel {
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

    func didReceiveTouch() {
        labels.forEach { label in
            label.isHidden = (label is TappableLabel) ? true : false
        }
    }
    
}
