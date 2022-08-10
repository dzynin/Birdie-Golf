//
//  Hole.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/4/22.
//

import Foundation
import CoreText

struct Hole {
    
    // MARK: - Properties
    var holeNumber: Int
    let par: Int
    var userScore: [UserScore]    // array of user scores
    
    enum HoleKey {
        static let holeNumber = "holeNumber"
        static let par = "par"
        static let userScore = "userScore"
        static let collectionType = "holes"
    }
    
    var holeData: [String:AnyHashable] {
        [HoleKey.holeNumber : self.holeNumber,
         HoleKey.par : self.par]
    }
    init (holeNumber: Int, par: Int = 0, userScore: [UserScore] = [], collectionType: String = "holes") {
        self.holeNumber = holeNumber
        self.par = par
        self.userScore = userScore
    }
    init?(from dictionary: [String:Any]) {
        guard let holeNumber = dictionary[HoleKey.holeNumber] as? Int,
              let par = dictionary[HoleKey.par] as? Int,
              let collectionType = dictionary[HoleKey.collectionType] as? String else {
                  return nil
              }
        self.init(holeNumber: holeNumber, par: par, collectionType: collectionType)
    }
    
}
