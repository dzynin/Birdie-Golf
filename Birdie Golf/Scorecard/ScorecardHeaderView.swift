//
//  ScorecardHeaderView.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/17/22.
//

import UIKit

class ScorecardHeaderView: UIView {

    
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var parLabel: UILabel = UILabel()
    lazy var golfer1Label: UILabel = UILabel()
    lazy var golfer2Label: UILabel = UILabel()
    lazy var golfer3Label: UILabel = UILabel()
    lazy var golfer4Label: UILabel = UILabel()
    
    convenience init(golfers: [Golfer]) {
        self.init()
        
        addSubviews()
        
        parLabel.text = "Par"
        let labels = [golfer1Label,
                      golfer2Label,
                      golfer3Label,
                      golfer4Label]

        for index in 0...3 {
            let label = labels[index]
            if index < golfers.count {
                label.text = golfers[index].golferName
            } else {
                label.text = "-"
            }
        }
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        parLabel.tintColor = .blue
        
        stackView.addArrangedSubview(parLabel)
        stackView.addArrangedSubview(golfer1Label)
        stackView.addArrangedSubview(golfer2Label)
        stackView.addArrangedSubview(golfer3Label)
        stackView.addArrangedSubview(golfer4Label)
    }
}
