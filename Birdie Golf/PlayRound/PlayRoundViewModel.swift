//
//  PlayRoundViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/9/22.
//

import Foundation

protocol PlayRoundViewModelDelegate: AnyObject {
    func updateViews()
}
class PlayRoundViewModel {
    
    var round: Round?

    
    private let service: FirebaseSyncable
    private weak var delegate: PlayRoundViewModelDelegate?
    
    init(service: FirebaseSyncable = FirebaseService(), delegate: PlayRoundViewModelDelegate){
        self.delegate = delegate
        self.service = service
    }
    
    func fetchCurrentRound() {
        service.fetchRound { result in
            switch result {
            case .failure(let error):
                // TODO: - add a delgate function for the failure case so that the view can show an alert
                print(error)
            case.success(let round):
                self.round = round
                self.delegate?.updateViews()
            }
        }
    }
    
    func updateRound(currentHole: Int, golfersPutts: [String], golfersStrokes: [String], currentGolferScores: [Int], par: Int) {
        guard let round = round else {return}
        for index in 0...round.golfers.count - 1 {
            round.golfers[index].holes[currentHole].putts = Int(golfersPutts[index]) ?? 0
            round.golfers[index].holes[currentHole].strokes = Int(golfersStrokes[index]) ?? 0
            round.golfers[index].currentScore += currentGolferScores[index]
            round.golfers[index].totalPutts += Int(golfersPutts[index]) ?? 0
            round.golfers[index].totalStrokes += Int(golfersStrokes[index]) ?? 0
            round.golfers[index].holes[currentHole].par = par
            
        }
        service.saveRound(round) { result in
            switch result {
            case .success(let data):
                print(data)
                self.delegate?.updateViews()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchHole(with hole: Hole) {
        
    }
    
    func numberOfHoles() -> Int {
        round?.numberOfHoles ?? 9
    }
} // end of class
