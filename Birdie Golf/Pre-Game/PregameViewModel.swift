//
//  PregameViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/8/22.
//

import Foundation

class PregameViewModel {
    
    var round: Round?
    private let service: FirebaseSyncable
    
    init(round: Round? = nil, firebaseService: FirebaseSyncable = FirebaseService()) {
        self.round = round
        self.service = firebaseService
    }
    
    func startRound(with courseName: String) {
        
    }
}
