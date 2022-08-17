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
    
    var golfersArray: [Golfer] = []
    
    init(service: FirebaseSyncable = FirebaseService(), delegate: RoundStartViewModelDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func createRound(with courseName: String, numberOfHoles: Int, golferNames: [String]) {
        for name in golferNames {
            var golfer = Golfer(golferName: name)
            for holeNumber in 1...numberOfHoles {
                let hole = Hole(holeNumber: holeNumber)
                golfer.holes.append(hole)
            }
            golfersArray.append(golfer)
        }
        
        let round = Round(courseName: courseName, numberOfHoles: numberOfHoles, golfers: golfersArray)
        service.saveRound(round) { result in
            switch result {
            case .success(let round):
                self.delegate?.roundSuccessfullyStarted()
            case .failure(let error):
                print(error)
            }
        }
    }
}
