//
//  LeaderboardViewModel.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/8/22.
//

import Foundation

protocol LeaderboardViewModelDelegate: AnyObject {
    func updateViews()
}

class LeaderboardViewModel {
    private var round: Round?
   private var userScoreArray: [UserScore] = []
    
    private weak var delegate: LeaderboardViewModelDelegate?
    
    init(round: Round, delegate: LeaderboardViewModelDelegate) {
        self.delegate = delegate
        self.round = round
    }
    
    func filteredUsersByBestScore() {
        guard let round = round else {
            return
        }
        for hole in round.holes {
            for var user in hole.userScore {
                let strokes = user.strokes
                let par = hole.par
                // we have the score we need
                let score = strokes - par
                print(score)
            // how am i going to take this score and tie it to a user
                user.currentScore += score
                // possibly append the score to the certain user it belongs to?
                let idk = hole.userScore.sorted(by: {$0.currentScore <= $1.currentScore})
            userScoreArray = idk
            }
        }
    }
    
}
