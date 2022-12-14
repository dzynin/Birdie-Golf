//
//  UserScore.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/8/22.
//

import Foundation

struct UserScore: Codable {
    let userID: String
    var strokes: Int
    var putts: Int
    var currentScore: Int
    
    
    enum USKey {
        static let userID = "userID"
        static let strokes = "strokes"
        static let putts = "putts"
       
        static let currentScore = "currentScore"
        
    }
    var userScoreData: [String:Any] {
        [USKey.userID : self.userID,
         USKey.strokes : self.strokes,
         USKey.putts : self.putts,
         USKey.currentScore : self.currentScore]
    }
    init(userID: String, strokes: Int = 0, putts: Int = 0, collectionType: String = "userScore", currentScore: Int = 0) {
        self.userID = userID
        self.strokes = strokes
        self.putts = putts
        self.currentScore = currentScore
    }
    
    init?(from dictionary: [String:Any]) {
        guard let userID = dictionary[USKey.userID] as? String,
              let strokes = dictionary[USKey.strokes] as? Int,
              let putts = dictionary[USKey.putts] as? Int,
              let currentScore = dictionary[USKey.currentScore] as? Int else {
                  return nil
              }
        self.init(userID: userID, strokes: strokes, putts: putts, currentScore: currentScore)
    }
}

