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
    var collectionType: String
    
    var holeData: [String:Any] {
        [HoleKey.holeNumber : self.holeNumber,
         HoleKey.par : self.par,
         HoleKey.userScore : self.userScore.map {$0.userScoreData},
         HoleKey.collectionType : self.collectionType]
    }
    init (holeNumber: Int, par: Int = 0, userScore: [UserScore], collectionType: String = "holes") {
        self.holeNumber = holeNumber
        self.par = par
        self.userScore = userScore
        self.collectionType = collectionType
    }
    
    init?(from dictionary: [String:Any]) {
        guard let holeNumber = dictionary[HoleKey.holeNumber] as? Int,
              let userScoreArray = dictionary[HoleKey.userScore] as? [[String : Any]],
              let collectionType = dictionary[HoleKey.collectionType] as? String else {
                  return nil
              }
        let par = dictionary[HoleKey.par] as? Int
        let userScores = userScoreArray.compactMap({UserScore(from: $0)})
        self.init(holeNumber: holeNumber, par: par ?? 0, userScore: userScores, collectionType: collectionType)
    }
    
}

extension Hole: Equatable {
    static func == (lhs: Hole, rhs: Hole) -> Bool {
        return lhs.holeNumber == rhs.holeNumber
    }
    
    
}
