//
//  FirebaseService.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/4/22.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import Firebase

enum FirebaseError: Error {
    case firebaseError(Error)
    case failedToUnwrapData
    case noDataFound
}

protocol FirebaseSyncable {
    func signIn(with email: String, password: String, completion: @escaping (Result<Bool,FirebaseError>) -> Void)
    func createAccount(with email: String, password: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void )
    func signInWithApple(token: String, nonce: String)
    func saveRound(_ round: Round, completion: @escaping (Result<Round, FirebaseError>) -> Void)
    func loadRounds(completion: @escaping (Result<[Round], FirebaseError>) -> Void)
    func deleteRound(round: Round)
    func logoutUser()
    func fetchRound(completion: @escaping (Result<Round, FirebaseError>) -> Void)
    
}

struct FirebaseService: FirebaseSyncable {
        
    
    
    
    let storage = Storage.storage().reference()
    let reference = Firebase.Database.database().reference()
    var currentUser: User?
    
    
func logoutUser() {
    let firebaseAuth = Auth.auth()
    do {
        try firebaseAuth.signOut()
    } catch let signOutError as NSError {
        print("Error signing out", signOutError)
    }
}
    
    func signInWithApple(token: String, nonce: String) {
        let credentials = OAuthProvider.credential(withProviderID: "apple.com", idToken: token, rawNonce: nonce)
        Auth.auth().signIn(with: credentials) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func createAccount(with email: String, password: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            switch authResult {
            case .some(let result):
                // not using this result properly
                UserDefaults.standard.set(result.user.uid, forKey: "userID")
                completion(.success(true))
            case .none:
                if let error = error {
                    completion(.failure(.firebaseError(error)))
                }
            }
        }
    }
    
    func signIn(with email: String, password: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { signInResult, error in
            switch signInResult {
            case .some(let result):
                completion(.success(true))
                guard let result = signInResult else { return }
                let id = result.user.uid
                let currentUser = User(userID: id, email: email, password: password, currentRound: nil, historicalRounds: [])
 //               self.currentUser = currentUser
            case .none:
                if let error = error {
                    completion(.failure(.firebaseError(error)))
                }
            }
        }
    }
    
    // MARK: - Saving, Loading, and Deleting rounds
    func saveRound(_ round: Round, completion: @escaping (Result<Round, FirebaseError>) -> Void) {
        
        // I have an issue with the view loading before the round is completely fetched. Race condition
        reference.child("rounds").child(round.uuid).updateChildValues(round.roundData) { error, reference in
            if let error = error {
                print(error)
                completion(.failure(.firebaseError(error)))
            }
            UserDefaults.standard.set(round.uuid, forKey: "activeRoundId")
            completion(.success(round))
        }
    }
    
    func loadRounds(completion: @escaping (Result<[Round], FirebaseError>) -> Void) {
        reference.child("rounds").getData { error, snapshot in
            if let error = error {
                completion(.failure(.firebaseError(error)))
                return
            }
            guard let data = snapshot?.value as? [String : [String : AnyObject]]
            else {
                completion(.failure(.noDataFound))
                return
            }
            let roundsArray = Array(data.values)
            let rounds = roundsArray.compactMap({Round(fromDictionary: $0)})
            completion(.success(rounds))
        }
    }
    
    func deleteRound(round: Round) {
        reference.child("rounds").child(round.uuid).removeValue()
    }
    
    
    func fetchRound(completion: @escaping (Result<Round, FirebaseError>) -> Void) {
        let currentRoundId = UserDefaults.standard.string(forKey: "activeRoundId")
        reference.child("rounds").child(currentRoundId!).getData { error, snapshot in
            if let error = error {
                completion(.failure(.firebaseError(error)))
                return
            }
            guard let data = snapshot?.value as? [String : Any]
            else {
                completion(.failure(.noDataFound))
                return
            }
            guard let round = Round(fromDictionary: data) else {
                completion(.failure(.noDataFound))
                return
            }
            completion(.success(round))
        }
        
    }
//    func saveCurrentRound() {
//        let currentRoundID = UserDefaults.standard.value(forKey: "activeRoundID")
//        reference.child("rounds").child(currentRoundId!).getData { error, snapshot in
//            if let error = error {
//                completion(.failure(.firebaseError(error)))
//                return
//            }
//            guard let data = snapshot?.value as? [String : Any]
//            else {
//                completion(.failure(.noDataFound))
//                return
//            }
//            guard let round = Round(fromDictionary: data) else {
//                completion(.failure(.noDataFound))
//                return
//            }
//            completion(.success(round))
//        }
//    }
}
