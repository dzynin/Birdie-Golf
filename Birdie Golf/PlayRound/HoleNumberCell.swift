//
//  HoleNumberCell.swift
//  Birdie Golf
//
//  Created by Scott Cox on 9/9/22.
//

import Foundation
import UIKit

class HoleNumberCell: UICollectionViewCell {
    
    static let nib = UINib(nibName: "HoleNumberCell", bundle: nil)
    static let reuseId = "HoleNumberCell"
    
    @IBOutlet weak var holeNumberLabel: UILabel!
    
    override func awakeFromNib() {
        self.cornerRadius = 20
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
    func setHole(_ hole: Hole?, indexPath: IndexPath, isCurrentHole: Bool) {
        holeNumberLabel.text = "\(indexPath.row + 1)"
        if isCurrentHole {
            backgroundColor = UIColor(named: "AccentColor")
        } else {
            backgroundColor = hole?.hasBeenPlayed == true ? .yellow : .white
        }
        
    }
}
