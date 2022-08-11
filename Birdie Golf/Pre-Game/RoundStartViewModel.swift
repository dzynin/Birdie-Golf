//
//  RoundStartViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/9/22.
//

import Foundation

protocol RoundStartViewModelDelegate: HoleSelectionAlertViewController {
    func roundSuccessfullyStarted()
}

class RoundStartViewModel {
    let service: FirebaseSyncable
    weak var delegate: RoundStartViewModelDelegate?
    
    var holesArray: [Hole] = []
    var usersArray: [User] = []
    
   
    init(service: FirebaseSyncable = FirebaseService()) {
        self.service = service
    }
    
    func fetchNumberOfHoles(numberOfHoles: Int) {
        for hole in 1...numberOfHoles {
            let newHole = Hole(holeNumber: hole)
            holesArray.append(newHole)
        }
    }
    
   
                          
    func startRound(with courseName: String, numberOfHoles: Int) {
        let round = Round(courseName: courseName, numberOfHoles: numberOfHoles, holes: holesArray, users: usersArray)
        service.saveRound(round) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let round):
                print(round.courseName)
                self?.delegate?.roundSuccessfullyStarted()
            }
        }
    }
}
