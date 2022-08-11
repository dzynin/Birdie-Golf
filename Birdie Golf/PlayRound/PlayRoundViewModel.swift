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
    
    init(round: Round, service: FirebaseSyncable = FirebaseService()) {
        self.round = round
        self.service = service
    }
    
    func fetchCurrentRound() {
        service.fetchRound()
    }
    
} // end of class
