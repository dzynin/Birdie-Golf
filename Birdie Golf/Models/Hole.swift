//
//  Hole.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/4/22.
//

import Foundation

struct Hole: Codable {
    
    // MARK: - Properties
    var holeNumber: Int
    var strokes: Int
    var putts: Int?
    let par: Int
    var userID: String
    var userScore: [UserScore]    // array of user scores
    
    var holeData: [String:AnyHashable]
    
    
}
