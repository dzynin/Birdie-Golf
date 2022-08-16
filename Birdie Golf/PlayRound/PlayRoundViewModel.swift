//
//  PlayRoundViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/9/22.
//

import Foundation

class PlayRoundViewModel {
    
    var round: Round?
    var currentHole: Hole?
    
    
    private let service: FirebaseSyncable
    
    init(service: FirebaseSyncable = FirebaseService()) {
        
        self.service = service
    }
    
    func fetchCurrentRound(completion: @escaping () -> Void) {
        service.fetchRound { result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let round):
                self.round = round
            }
            completion()
        }
    }
    
    func golfer(at index: Int) -> Golfer? {
        guard let golferCount = round?.golfers.count, index <= golferCount - 1 else { return nil }
        return round?.golfers[index]
    }
    
    func saveHole() {
        // how do we know what hole we are on? 
        guard let round = round, let hole = currentHole else {
            return
        }

        service.saveRound(round) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchHole(with hole: Hole) {
        
    }
} // end of class
