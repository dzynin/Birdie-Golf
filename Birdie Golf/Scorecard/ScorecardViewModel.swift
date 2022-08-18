//
//  ScorecardViewModel.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/17/22.
//

import Foundation

protocol ScorecardViewModelDelegate: AnyObject {
    func roundLoadedSuccessfully()
}

class ScorecardViewModel {
    weak var delegate: ScorecardViewModelDelegate?
    
    //    var golfersScore: [Golfer] = []
    var rowsData: [ScorecardRowData] = []
    var round: Round?
    var service: FirebaseSyncable
    
    init(service: FirebaseSyncable = FirebaseService(), delegate: ScorecardViewModelDelegate) {
        self.service = service
        self.delegate = delegate
        
        fetchRound()
    }
    
    private func fetchRound() {
        service.fetchRound { [weak self] result in
            switch result {
            case .success(let round):
                self?.round = round
                self?.rowsData = self?.createRowsData(with: round) ?? []
                self?.delegate?.roundLoadedSuccessfully()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func createRowsData(with round: Round) -> [ScorecardRowData] {
        var allGolferStrokesByHole: [[Int]] = []
        for golfer in round.golfers {
            var strokesByHole: [Int] = []
            for hole in golfer.holes {
                strokesByHole.append(hole.strokes)
            }
            allGolferStrokesByHole.append(strokesByHole)
        }
        
        print(allGolferStrokesByHole)
        
        let holes = round.golfers.first?.holes ?? []
        guard !holes.isEmpty
        else { return [] }
        
        var rowsData: [ScorecardRowData] = []
        for (index, hole) in holes.enumerated() {
            print(index)
            
            var strokesForHole: [String] = []
            for individualGolferStrokesByHole in allGolferStrokesByHole {
                let strokes = individualGolferStrokesByHole[index]
                strokesForHole.append(String(strokes))
            }
            
            rowsData.append(ScorecardRowData(holeNumber: String(hole.holeNumber), par: String(hole.par), golferScores: strokesForHole))
        }
        
        return rowsData
    }
}

struct ScorecardRowData {
    let holeNumber: String
    let par: String
    let golferScores: [String]
}
