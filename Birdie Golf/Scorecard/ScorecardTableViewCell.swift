//
//  ScorecardTableViewCell.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/17/22.
//

import UIKit

class ScorecardTableViewCell: UITableViewCell {

    @IBOutlet weak var parForHoleLabel: UILabel!
    @IBOutlet weak var golfer1Score: UILabel!
    @IBOutlet weak var golfer2Score: UILabel!
    @IBOutlet weak var golfer3Score: UILabel!
    @IBOutlet weak var golfer4Score: UILabel!
    @IBOutlet weak var holeNumber: UILabel!

//    func updateViews(with golfer: Golfer) {
    func updateViews(with rowData: ScorecardRowData) {
        holeNumber.text = rowData.holeNumber
        parForHoleLabel.text = rowData.par
        
        let columns = [golfer1Score, golfer2Score, golfer3Score, golfer4Score]
        
        for index in 0...3 {
            let scoreLabel = columns[index]
            if index < rowData.golferScores.count {
                let golferScore = rowData.golferScores[index]
                scoreLabel?.text = golferScore
                print(" \(golferScore)")
            } else {
                scoreLabel?.text = "-"
                print("-")
            }
        }
//        for index in 0..<rowData.golferScores.count {
//            guard let label = columns[index]
//            else { return }
//
////            label.isHidden = false
//            label.text = rowData.golferScores[index]
//        }
    }
    
    func updateHolePar(with hole: Hole) {
        parForHoleLabel.text = "\(hole.par)"
        holeNumber.text = "\(hole.holeNumber)"
    }


}
