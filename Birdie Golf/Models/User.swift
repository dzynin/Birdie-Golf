//
//  User.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/2/22.
//

import Foundation

class User: Codable {
    enum Key {

        static let userID = "userID"
        static var email = "email"
        static let historicalRounds = "historicalRounds"
        static let collectionType = "users"
    }
    
    let userID: String
    var email: String
    var historicalRounds: [Round]
    let collectionType: String
    
    // Dictionary representation
    var userData: [String : Any] {
        [Key.userID : self.userID,
         Key.email : self.email,
         Key.collectionType : self.collectionType,
         Key.historicalRounds : self.historicalRounds.map {$0.roundData}]
    }
    
    init(userID: String, email: String, historicalRounds: [Round], collectionType: String = "users" ) {
        
        self.userID = userID
        self.email = email
        self.historicalRounds = historicalRounds
        self.collectionType = collectionType
    }
    convenience init?(from dictionary: [String:Any]) {
            guard let userID = dictionary[Key.userID] as? String,
                  let collectionType = dictionary[Key.collectionType] as? String,
                  let email = dictionary[Key.email] as? String,
                  let roundsArray = dictionary[Key.historicalRounds] as? [[String : Any]]
            else { return nil }
        let historicalRounds = roundsArray.compactMap({Round(fromDictionary: $0)})
        self.init(userID: userID, email: email, historicalRounds: historicalRounds, collectionType: collectionType)
        }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.userID == rhs.userID
    }
    
    
}
