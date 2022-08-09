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
    
    init(service: FirebaseSyncable = FirebaseService()) {
        self.service = service
    }
    
    func startRound(with courseName: String, numberOfHoles: Int, users: [User] = [], holes: [Hole] = []) {
        let round = Round(courseName: courseName, numberOfHoles: numberOfHoles, holes: holes, users: users)
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
