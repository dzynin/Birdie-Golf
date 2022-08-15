//
//  RoundStartViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/9/22.
//

import Foundation
import Firebase

protocol RoundStartViewModelDelegate: HoleSelectionAlertViewController {
    func roundSuccessfullyStarted()
}

class RoundStartViewModel {
    let service: FirebaseSyncable
    weak var delegate: RoundStartViewModelDelegate?
    
    var holesArray: [Hole] = []
    var usersArray: [User] = []
//    var golfersArray: [Golfer] = []
    var userScoreArray: [UserScore] = []
 
   
    init(service: FirebaseSyncable = FirebaseService()) {
        self.service = service
    }
    
    func fetchNumberOfHoles(numberOfHoles: Int) {
        for hole in 1...numberOfHoles {
            let newHole = Hole(holeNumber: hole, userScore: userScoreArray)
            holesArray.append(newHole)
        }
    }
    
    func fetchUserScore() {
            let userScore = UserScore(userID: "test")
        userScoreArray.append(userScore)
    }
    
//    func fetchNumberOfGolfers(numberOfGolfers: Int) {
//        for golfer in 1...numberOfGolfers {
//            fetchUserScore()
//            let golferName = "Golfer #\(golfer)"
//            let newGolfer = Golfer(golferName: golferName)
//            golfersArray.append(newGolfer)
//        }
//    }
    
    func fetchGolfers() {
        
    }
   
                          
    func startRound(with courseName: String, numberOfHoles: Int, golfers: [Golfer]) {
        let round = Round(courseName: courseName, numberOfHoles: numberOfHoles, holes: holesArray, golfers: golfers)
        service.saveRound(round) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let round):
                print(round.courseName)
                self?.delegate?.roundSuccessfullyStarted()
                // now that the round exists... this is the round that needs to pass to all the other screens,
            }
        }
    }
}
