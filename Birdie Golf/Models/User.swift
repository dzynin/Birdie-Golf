//
//  User.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/2/22.
//

import Foundation

class User {
    enum Key {
        static var userName = "userName"
        static let userID = "userID"
        static let firebaseID = "firebaseID"
        static var email = "email"
        static var password = "password"
    }
    var userName: String
    let firebaseID: String
    let userID: String
    var email: String
    var password: String
    let currentRound: Round?
    let historicalRound: [Round]?
    
    init(userName: String, firebaseID: String, userID: String, email: String, password: String, currentRound: Round?, historicalRound: [Round]? ) {
        self.userName = userName
        self.firebaseID = firebaseID
        self.userID = userID
        self.email = email
        self.password = password
        self.currentRound = currentRound
        self.historicalRound = historicalRound
    }
}
