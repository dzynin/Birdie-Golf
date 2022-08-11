//
//  PlayRoundViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/9/22.
//

import Foundation

class PlayRoundViewModel {
    
    var round: Round?
    private let service: FirebaseSyncable
    
    init(service: FirebaseSyncable = FirebaseService()) {
        
        self.service = service
    }
    
    func fetchCurrentRound() {
        service.fetchRound { result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let round):
                self.round = round
            }
        }
    }
    
} // end of class
