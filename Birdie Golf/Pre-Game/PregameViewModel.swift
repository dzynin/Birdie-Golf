//
//  PregameViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/8/22.
//

import Foundation
import UIKit

protocol PregameViewModelDelegate: AnyObject {
    func roundsLoadedSuccessfully()
}

class PregameViewModel {
    
    var rounds: [Round] = []
    var round: Round?
    
    
    private let service: FirebaseSyncable
    private weak var delegate: PregameViewModelDelegate?
    
    init(round: Round? = nil, firebaseService: FirebaseSyncable = FirebaseService(), delegate: PregameViewModelDelegate) {
        self.round = round
        self.service = firebaseService
        self.delegate = delegate
    }
 
    
    func loadRounds() {
        service.loadRounds { result in
            switch result {
            case .success(let rounds):
                self.rounds = rounds
                self.delegate?.roundsLoadedSuccessfully()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func delete(index: Int) {
        let round = rounds[index]
        rounds.remove(at: index)
        service.deleteRound(round: round)
    }
}
