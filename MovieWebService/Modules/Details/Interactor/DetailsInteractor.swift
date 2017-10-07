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
    
    typealias LabelParams = (UILabel, CGRect, String, CGFloat)
    
    enum Label {
        case directorName(LabelParams)
        case directorNameValue(LabelParams)
        case tapToShowMore(LabelParams)
        case actorName(LabelParams)
        case actorNameValue(LabelParams)
        case actorScreenName(LabelParams)
        case actorScreenNameValue(LabelParams)
    }
    
    var labels: [UILabel]!

    // MARK: - DetailsInteractorInput
    
    func setViewForSetup(_ view: UIView) {
        self.view = view
    }
    
    func setData(_ data: Director?) {
        guard let director = data, !director.film.cast.isEmpty else {
            print("Invalid director data")
            return
        }
        
        let labelFontSize: CGFloat = 18.0
        let labelValueFontSize: CGFloat = 15.0
        let labelFrame = CGRect(x: 20, y: 100, width: 200, height: 30)

        let actor = director.film.cast[0]
        
        labels = [
            Label.directorName((UILabel(),
                               labelFrame,
                               "Director Name",
                               labelFontSize)),
            Label.directorNameValue((UILabel(),
                                    labelFrame.offsetBy(dx: 0, dy: 50),
                                    director.name ?? "Unknown director name",
                                    labelValueFontSize)),
            Label.tapToShowMore((TappableLabel(),
                                labelFrame.offsetBy(dx: 0, dy: 120),
                                "Tap here to show more",
                                labelFontSize)),
            Label.actorName((UILabel(),
                            labelFrame.offsetBy(dx: 0, dy: 120),
                            "Actor Name",
                            labelFontSize)),
            Label.actorNameValue((UILabel(),
                                 labelFrame.offsetBy(dx: 0, dy: 170),
                                 actor.name ?? "Unknown actor name",
                                 labelValueFontSize)),
            Label.actorScreenName((UILabel(),
                                  labelFrame.offsetBy(dx: 0, dy: 220),
                                  "Actor Screen Name",
                                  labelFontSize)),
            Label.actorScreenNameValue((UILabel(),
                                       labelFrame.offsetBy(dx: 0, dy: 270),
                                       actor.screenName ?? "Unknown actor screen name",
                                       labelValueFontSize))
            ]
            .map(makeALabel)
        
        labels.forEach { self.view.addSubview($0) }
        
    }
    
    
    // MARK: Helpers
    
    private func makeALabel(_ label: Label) -> UILabel {
        let labelParams: LabelParams
        
        switch label {
        case let .directorName(params):
            labelParams = params
        case let .directorNameValue(params):
            labelParams = params
        case let .tapToShowMore(params):
            labelParams = params
            (labelParams.0 as! TappableLabel).delegate = self
        case let .actorName(params):
            labelParams = params
            labelParams.0.isHidden = true
        case let .actorNameValue(params):
            labelParams = params
            labelParams.0.isHidden = true
        case let .actorScreenName(params):
            labelParams = params
            labelParams.0.isHidden = true
        case let .actorScreenNameValue(params):
            labelParams = params
            labelParams.0.isHidden = true
        }
        
        let label = labelParams.0
        let frame = labelParams.1
        let text = labelParams.2
        let fontSize = labelParams.3
        
        label.frame = frame
        label.text = text
        label.font = label.font.withSize(fontSize)
        
        return label
    }

    
    // MARK: TappableLabelDelegate
    
    func didReceiveTouch() {
        labels.forEach { label in
            label.isHidden = (label is TappableLabel) ? true : false
        }
    }
    
}
