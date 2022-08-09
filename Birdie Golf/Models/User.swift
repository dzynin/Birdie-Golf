//
//  User.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/2/22.
//

import Foundation
// update the User to have a current round which is a round object and a roundHistory [Round]

class User: Codable {
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
    
    
    init(userName: String, firebaseID: String, userID: String, email: String, password: String) {
        self.userName = userName
        self.firebaseID = firebaseID
        self.userID = userID
        self.email = email
        self.password = password
    }
}
