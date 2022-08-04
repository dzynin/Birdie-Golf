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
    }
    
    // MARK: - Properties
    var courseName: String
    let date: Date
    var holes: [Hole]
    var users: [User]
    let uuid: String
    
    // Dictionary representation
    var roundData: [String: AnyHashable] {
        ["courseName": self.courseName,
         "date": self.date,
         "uuid": self.uuid]
    }
    
    init(courseName: String, date: Date, holes: [Hole] = [], users: [User] = [], uuid: String = UUID().uuidString, collectionType: String) {
        self.courseName = courseName
        self.date = date
        self.holes = holes
        self.users = users
        self.uuid = uuid
    }
} // End of Class

extension Round {
    
    convenience init?(fromDictionary dictionary: [String: Any]) {
        guard let courseName = dictionary[RoundKeys.courseName] as? String,
              let date = dictionary[RoundKeys.date] as? Double,
              let collectionType = dictionary[RoundKeys.collectionType] as? String,
              let uuid = dictionary[RoundKeys.uuid] as? String else {
            return nil
        }
        self.init(courseName: courseName,
                  date: date,
                  uuid: uuid,
                  collectionType: collectionType)
    }
}

extension Round: Equatable {
    static func == (lhs: Round, rhs: Round) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
