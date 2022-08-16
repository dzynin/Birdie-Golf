//
//  Round.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/4/22.
//

import Foundation

class Round: Codable {
    
    enum RoundKeys {
        static let courseName = "courseName"
        static let uuid = "uuid"
        static let collectionType = "rounds"
        static let holes = "holes"
//        static let users = "users"
        static let numberOfHoles = "numberOfHoles"
        static let golfers = "golfers"
    }
    
    // MARK: - Properties
    var courseName: String
    var numberOfHoles: Int
    let uuid: String
    var holes: [Hole]
//    var users: [User]
    var golfers: [Golfer]
    
    
    // Dictionary representation
    var roundData: [String: Any] {
        [RoundKeys.courseName: self.courseName,
         RoundKeys.numberOfHoles: self.numberOfHoles,
         RoundKeys.holes: self.holes.map {$0.holeData},
//         RoundKeys.users: self.users.map {$0.userData},
         RoundKeys.golfers: self.golfers.map {$0.golferData},
         RoundKeys.uuid: self.uuid]
    }
    
    // MARK: - Initializers
    init(courseName: String, numberOfHoles: Int, holes: [Hole], golfers: [Golfer], uuid: String = UUID().uuidString) {
        self.courseName = courseName
        self.numberOfHoles = numberOfHoles
        self.holes = holes
//        self.users = users
        self.golfers = golfers
        self.uuid = uuid
        
    }
} // End of Class

extension Round {

    convenience init?(fromDictionary dictionary: [String: Any]) {
        guard let courseName = dictionary[RoundKeys.courseName] as? String,
              let numberOfHoles = dictionary[RoundKeys.numberOfHoles] as? Int,
              let holesArray = dictionary[RoundKeys.holes] as? [[String : Any]],
              let golfersArray = dictionary[RoundKeys.golfers] as? [[String : Any]],
              let uuid = dictionary[RoundKeys.uuid] as? String else {
            return nil
        }
        let holes = holesArray.compactMap({ Hole(from: $0) })
        let golfers = golfersArray.compactMap({Golfer(from: $0)})
        self.init(courseName: courseName,
                  numberOfHoles: numberOfHoles,
                  holes: holes,
                  golfers: golfers,
                  uuid: uuid)
    }
}

extension Round: Equatable {
    static func == (lhs: Round, rhs: Round) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
