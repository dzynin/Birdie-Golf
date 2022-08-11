//
//  AddUserViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/10/22.
//

import Foundation



class AddUserViewModel {
    
   
    var golferArray: [Golfer] = []
    
   
    
    func fetchGolfer(with golferName: String) {
        for golfer in golferArray {
        let newGolfer = Golfer(golferName: golferName)
                golferArray.append(newGolfer)
        }
    }
}
