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
        static let holes = "holes"
        static let totalStrokes = "totalStrokes"
        static let totalPutts = "totalPutts"
        static let currentScore = "currentScore"
    }
    
    var golferName: String
    var holes: [Hole]
    var totalStrokes: Int
    var totalPutts: Int
    var currentScore: Int
    
    
    var golferData: [String : Any] {
        [GolferKey.golferName : self.golferName,
         GolferKey.holes : self.holes.map {$0.holeData},
         GolferKey.totalStrokes : self.totalStrokes,
         GolferKey.totalPutts : self.totalPutts,
         GolferKey.currentScore : self.currentScore]
    }
    
    init(golferName: String, holes: [Hole] = [], totalStrokes: Int = 0, totalPutts: Int = 0, currentScore: Int = 0) {
        self.golferName = golferName
        self.holes = holes
        self.totalStrokes = totalStrokes
        self.totalPutts = totalPutts
        self.currentScore = currentScore
        
    }
    
    init?(from dictionary: [String : Any]) {
        guard let golferName = dictionary[GolferKey.golferName] as? String,
              let holes = dictionary[GolferKey.holes] as? [[String : Any]],
              let totalStrokes = dictionary[GolferKey.totalStrokes] as? Int,
              let totalPutts = dictionary[GolferKey.totalPutts] as? Int,
              let currentScore = dictionary[GolferKey.currentScore] as? Int else {
            return nil
        }
        let holesArray = holes.compactMap({ Hole(from: $0)})
        self.init(golferName: golferName, holes: holesArray, totalStrokes: totalStrokes, totalPutts: totalPutts, currentScore: currentScore)
    }
}

