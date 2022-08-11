//
//  AddUserViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/10/22.
//

import Foundation



class AddUserViewModel {
    
   
    var golferArray: [Golfer] = []
    var round: Round?
    
    init(round: Round) {
        self.round = round
    }
    
    func fetchGolfer(with golferName: String) {
        let newGolfer = Golfer(golferName: golferName)
        golferArray.append(newGolfer)
    }
}

