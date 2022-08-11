//
//  Golfer.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/10/22.
//

import Foundation

struct Golfer {
    enum GolferKey {
        static let golferName = "golferName"
        static let collectionType = "golfers"
    }
    
    var golferName: String
    var collectionType: String
    
    var golferData: [String : Any] {
        [GolferKey.golferName : self.golferName,
         GolferKey.collectionType : self.collectionType]
    }
    
    init(golferName: String, collectionType: String = "golfers") {
        self.golferName = golferName
        self.collectionType = collectionType
    }
    init?(from dictionary: [String : Any]) {
        guard let golferName = dictionary[GolferKey.golferName] as? String,
              let collectionType = dictionary[GolferKey.collectionType] as? String else {
            return nil
        }
        self.init(golferName: golferName, collectionType: collectionType)
    }
}

