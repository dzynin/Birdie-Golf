//
//  User.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/2/22.
//

import Foundation
// update the User to have a current round which is a round object and a roundHistory [Round]

class User {
    enum Key {
        static var userName = "userName"
        static let userID = "userID"
        static let firebaseID = "firebaseID"
        static var email = "email"
        static var password = "password"
        static let collectionType = "users"
        static let currentRound = "currentRound"
        static let historicalRounds = "historicalRounds"
    }
    var userName: String
    let firebaseID: String
    let userID: String
    var email: String
    var password: String
    let currentRound: Round?
    let historicalRounds: [Round]?
    

    

    init(userName: String, firebaseID: String, userID: String, email: String, password: String, currentRound: Round?, historicalRounds: [Round]?, collectionType: String ) {

        self.userName = userName
        self.firebaseID = firebaseID
        self.userID = userID
        self.email = email
        self.password = password
        self.currentRound = currentRound
        self.historicalRounds = historicalRounds
    }
//    convenience init?(from dictionary: [String:Any]) {
//        guard let userName = dictionary[Key.userName] as? String,
//              let firebaseID = dictionary[Key.firebaseID] as? String,
//              let userID = dictionary[Key.userID] as? String,
//              let collectionType = dictionary[Key.collectionType] as? String,
//              let currentRound = dictionary[Key.currentRound] as? Round,
//              let historicalRounds = dictionary[Key.historicalRounds] as? [Round]
//        else { return nil }
//        self.init(userName: userName, firebaseID: firebaseID, userID: userID,currentRound: currentRound, historicalRounds: historicalRounds, collectionType: collectionType)
//    }
}
