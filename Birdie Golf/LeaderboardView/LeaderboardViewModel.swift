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
    var round: Round?
    var userScoreArray: [Golfer] = []
    let service: FirebaseSyncable
    
    private weak var delegate: LeaderboardViewModelDelegate?
    
    init(delegate: LeaderboardViewModelDelegate, service: FirebaseSyncable = FirebaseService()) {
        self.delegate = delegate
        self.service = service
        filteredUsersByBestScore()
    }
    
    func filteredUsersByBestScore() {
        service.fetchRound { result in
            switch result {
            case .success(let round):
                self.round = round
                for gofler in round.golfers {
                    let filteredGolfers = round.golfers.sorted(by: {$0.currentScore <= $1.currentScore})
                    self.userScoreArray = filteredGolfers
                    self.delegate?.updateViews()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}



