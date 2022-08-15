//
//  LeaderboardTableViewCell.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/8/22.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let round: Round?
 
    func fetchScore() {
        
    }

}
