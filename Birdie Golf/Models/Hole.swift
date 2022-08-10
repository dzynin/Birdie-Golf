//
//  Hole.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/4/22.
//

import Foundation
import CoreText

struct Hole: Codable {
   
    enum HoleKey {
        static let holeNumber = "holeNumber"
        static let par = "par"
        static let userScore = "userScore"
        static let collectionType = "holes"
    }
    
    // MARK: - Properties
    var holeNumber: Int
    let par: Int
    var userScore: [UserScore]    // array of user scores
    
    
    var holeData: [String:Any] {
        [HoleKey.holeNumber : self.holeNumber,
         HoleKey.par : self.par,
         HoleKey.userScore : self.userScore]
    }
    init (holeNumber: Int, par: Int = 0, userScore: [UserScore] = [], collectionType: String = "holes") {
        self.holeNumber = holeNumber
        self.par = par
        self.userScore = userScore
    }
    init?(from dictionary: [String:Any]) {
        guard let holeNumber = dictionary[HoleKey.holeNumber] as? Int,
              let par = dictionary[HoleKey.par] as? Int,
              let userScore = dictionary[HoleKey.userScore] as? [UserScore],
              let collectionType = dictionary[HoleKey.collectionType] as? String else {
                  return nil
              }
        self.init(holeNumber: holeNumber, par: par, userScore: userScore, collectionType: collectionType)
    }
    
}

extension Hole: Equatable {
    static func == (lhs: Hole, rhs: Hole) -> Bool {
        return lhs.holeNumber == rhs.holeNumber
    }
    
    
}
