//
//  User.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/2/22.
//

import Foundation

class User: Codable {
    enum Key {
        static var userName = "userName"
        static let userID = "userID"
        static let firebaseID = "firebaseID"
        static var email = "email"
        static var password = "password"
        static let historicalRounds = "historicalRounds"
        static let currentRound = "currentRound"
        static let collectionType = "users"
    }
    var userName: String
    let firebaseID: String
    let userID: String
    var email: String
    var password: String
    let currentRound: Round
    let historicalRounds: [Round]?
    let collectionType: String
    
    // Dictionary representation
    var userData: [String : Any] {
        [Key.userName : self.userName,
         Key.firebaseID : self.firebaseID,
         Key.userID : self.userID,
         Key.email : self.email,
         Key.password : self.password,
         Key.currentRound : self.currentRound,
         Key.historicalRounds : self.historicalRounds]
    }
    
    init(userName: String, firebaseID: String, userID: String, email: String, password: String, currentRound: Round, historicalRounds: [Round]?, collectionType: String ) {
        self.userName = userName
        self.firebaseID = firebaseID
        self.userID = userID
        self.email = email
        self.password = password
        self.currentRound = currentRound
        self.historicalRounds = historicalRounds
        self.collectionType = collectionType
    }
    convenience init?(from dictionary: [String:Any]) {
            guard let userName = dictionary[Key.userName] as? String,
                  let firebaseID = dictionary[Key.firebaseID] as? String,
                  let userID = dictionary[Key.userID] as? String,
                  let collectionType = dictionary[Key.collectionType] as? String,
                  let email = dictionary[Key.email] as? String,
                  let password = dictionary[Key.password] as? String,
                  let currentRound = dictionary[Key.currentRound] as? Round,
                  let historicalRounds = dictionary[Key.historicalRounds] as? [Round]
            else { return nil }
        self.init(userName: userName, firebaseID: firebaseID, userID: userID, email: email, password: password, currentRound: currentRound, historicalRounds: historicalRounds, collectionType: collectionType)
        }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.userID == rhs.userID
    }
    
    
}
