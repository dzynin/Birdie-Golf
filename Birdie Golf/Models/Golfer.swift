//
//  Golfer.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/10/22.
//

import Foundation

struct Golfer: Codable {
    enum GolferKey {
        static let golferName = "golferName"
        
        static let strokes = "strokes"
        static let putts = "putts"
        static let currentScore = "currentScore"
    }
    
    var golferName: String
    var strokes: Int
    var putts: Int
    var currentScore: Int
    
    
    var golferData: [String : Any] {
        [GolferKey.golferName : self.golferName,
         GolferKey.strokes : self.strokes,
         GolferKey.putts : self.putts,
         GolferKey.currentScore : self.currentScore]
    }
    
    init(golferName: String, strokes: Int = 0, putts: Int = 0, currentScore: Int = 0) {
        self.golferName = golferName
        self.strokes = strokes
        self.putts = putts
        self.currentScore = currentScore
       
    }
    init?(from dictionary: [String : Any]) {
        guard let golferName = dictionary[GolferKey.golferName] as? String,
              let strokes = dictionary[GolferKey.strokes] as? Int,
              let putts = dictionary[GolferKey.putts] as? Int,
              let currentScore = dictionary[GolferKey.currentScore] as? Int else {
            return nil
        }
        self.init(golferName: golferName, strokes: strokes, putts: putts, currentScore: currentScore)
    }
}

