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
        static let date = "date"
        static let uuid = "uuid"
        static let collectionType = "rounds"
        static let holes = "holes"
        static let users = "users"
        static let numberOfHoles = "numberOfHoles"
    }
    
    // MARK: - Properties
    var courseName: String
    var numberOfHoles: Int
    let uuid: String
    var holes: [Hole]
    var users: [User]
    
    
    // Dictionary representation
    var roundData: [String: Any] {
        [RoundKeys.courseName: self.courseName,
         RoundKeys.numberOfHoles: self.numberOfHoles,
         RoundKeys.holes: self.holes.map {$0.holeData},
         RoundKeys.users: self.users.map {$0.userData},
         RoundKeys.uuid: self.uuid]
    }
    
    // MARK: - Initializers
    init(courseName: String, numberOfHoles: Int, date: Date = Date(), holes: [Hole] = [], users: [User] = [], uuid: String = UUID().uuidString) {
        self.courseName = courseName
        self.numberOfHoles = numberOfHoles
        self.holes = holes
        self.users = users
        self.uuid = uuid
    }
} // End of Class

extension Round {

    convenience init?(fromDictionary dictionary: [String: Any]) {
        guard let courseName = dictionary[RoundKeys.courseName] as? String,
              let numberOfHoles = dictionary[RoundKeys.numberOfHoles] as? Int,
              let holes = dictionary[RoundKeys.holes] as? [Hole],
              let users = dictionary[RoundKeys.users] as? [User],
              let uuid = dictionary[RoundKeys.uuid] as? String else {
            return nil
        }
        self.init(courseName: courseName,
                  numberOfHoles: numberOfHoles,
                  holes: holes,
                  users: users,
                  uuid: uuid)
    }
}

extension Round: Equatable {
    static func == (lhs: Round, rhs: Round) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
