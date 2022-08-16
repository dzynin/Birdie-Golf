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
        static let strokes = "strokes"
        static let putts = "putts"
    }
    
    // MARK: - Properties
    var holeNumber: Int
    let par: Int
    var strokes: Int
    var putts: Int
    
    var holeData: [String:Any] {
        [HoleKey.holeNumber : self.holeNumber,
         HoleKey.par : self.par,
         HoleKey.strokes : self.strokes,
         HoleKey.putts : self.putts]
    }
    init (holeNumber: Int, par: Int = 0, strokes: Int = 0, putts: Int = 0) {
        self.holeNumber = holeNumber
        self.par = par
        self.strokes = strokes
        self.putts = putts
        
    }
    
    init?(from dictionary: [String:Any]) {
        guard let holeNumber = dictionary[HoleKey.holeNumber] as? Int,
        let par = dictionary[HoleKey.par] as? Int,
        let strokes = dictionary[HoleKey.strokes] as? Int,
        let putts = dictionary[HoleKey.putts] as? Int else {
                  return nil
              }
        
        self.init(holeNumber: holeNumber, par: par, strokes: strokes, putts: putts)
    }
    
}

extension Hole: Equatable {
    static func == (lhs: Hole, rhs: Hole) -> Bool {
        return lhs.holeNumber == rhs.holeNumber
    }
    
    
}
