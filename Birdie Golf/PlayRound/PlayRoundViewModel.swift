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
    
    func numberOfGolfers() -> Int {
        guard let round = round else {
            return 0
        }
        return round.golfers.count
    }
    
} // end of class
