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
    
    init(holeNumber: Int, strokes: Int, putts: Int?) {
        self.holeNumber = holeNumber
        self.strokes = strokes
        self.putts = putts
    }
}
