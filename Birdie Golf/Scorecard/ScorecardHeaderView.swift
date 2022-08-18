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
    lazy var spacerView: UIView = UIView()
    lazy var parLabel: UILabel = UILabel()
    lazy var golfer1Label: UILabel = UILabel()
    lazy var golfer2Label: UILabel = UILabel()
    lazy var golfer3Label: UILabel = UILabel()
    lazy var golfer4Label: UILabel = UILabel()
    
    convenience init(golfers: [Golfer]) {
        self.init()
        
        addSubviews()
        spacerView.backgroundColor = .white
//        self.backgroundColor = UIColor(named: "AccentColor")
        golfer1Label.backgroundColor = UIColor(named: "AccentColor")
        golfer1Label.textColor = .white
        golfer1Label.cornerRadius = 4
        
        golfer2Label.backgroundColor = UIColor(named: "AccentColor")
        golfer2Label.textColor = .white
        golfer2Label.cornerRadius = 4
        
        golfer3Label.backgroundColor = UIColor(named: "AccentColor")
        golfer3Label.textColor = .white
        golfer3Label.cornerRadius = 4
        
        golfer4Label.backgroundColor = UIColor(named: "AccentColor")
        golfer4Label.textColor = .white
        golfer4Label.cornerRadius = 4
        
        parLabel.backgroundColor = .systemGray
        parLabel.textColor = .white
        parLabel.cornerRadius = 4
        parLabel.textAlignment = .center
        
        golfer1Label.textAlignment = .center
        golfer2Label.textAlignment = .center
        golfer3Label.textAlignment = .center
        golfer4Label.textAlignment = .center
        parLabel.text = "Par"
        let labels = [golfer1Label,
                      golfer2Label,
                      golfer3Label,
                      golfer4Label]

        for index in 0...3 {
            let label = labels[index]
            if index < golfers.count {
                let name = golfers[index].golferName
//                var placeholder = ""
//                var count = 1
//                for char in name {
//                    if count <= 2 {
//                        placeholder.append(char)
//                        count += 1
//                    }
//                }
                label.text = name
            } else {
                label.text = "-"
            }
        }
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 23
        stackView.distribution = .fillEqually
        
        addConstraints([
            spacerView.widthAnchor.constraint(equalToConstant: 40),
//            golfer1Label.widthAnchor.constraint(equalToConstant: 40),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        parLabel.tintColor = .blue
        stackView.addArrangedSubview(spacerView)
        stackView.addArrangedSubview(parLabel)
        stackView.addArrangedSubview(golfer1Label)
        stackView.addArrangedSubview(golfer2Label)
        stackView.addArrangedSubview(golfer3Label)
        stackView.addArrangedSubview(golfer4Label)
    }
}
