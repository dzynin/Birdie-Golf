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
    func deleteUser(user: User)
    func fetchRound(completion: @escaping (Result<Round, FirebaseError>) -> Void)
    func saveUserToFirebase(with user: User, completion: @escaping (Result<Bool, FirebaseError>) -> Void)
    func updateUser(with user: User, completion: @escaping (Result<Bool, FirebaseError>) -> Void)
    func fetchUser(completion: @escaping (Result<User, FirebaseError>) -> Void)
    func deleteUserFromFirebase(with userID: String)
    func saveHistoricalRound(_ user: User, _ round: Round, completion: @escaping (Result<User, FirebaseError>) -> Void)
    func addRoundToUser(_ round: Round)
}

struct FirebaseService: FirebaseSyncable {
    
    
    let storage = Storage.storage().reference()
    let reference = Firebase.Database.database().reference()
    var currentUser: User?
    
    //MARK: Need to remove the hardcoding of this function
    func addRoundToUser(_ round: Round) {
        reference.child("users").child("tXYy9T22ZwQyA4VGojZC2vzYL9d2").child("historicalRounds").child(round.uuid).updateChildValues(round.roundData)
    }
    
    func updateUser(with user: User, completion: @escaping (Result<Bool, FirebaseError>) -> Void) {
        reference.child("users").child(user.userID).updateChildValues(user.userData) { error, data in
            if let error = error {
                print(error)
                completion(.failure(.firebaseError(error)))
            }
        }
    }
    func saveUserToFirebase(with user: User, completion: @escaping (Result<Bool, FirebaseError>) -> Void) {
        reference.child("users").child(user.userID).updateChildValues(user.userData) { error, data in
            if let error = error {
                print(error)
                completion(.failure(.firebaseError(error)))
            }
            completion(.success(true))
        }
        
    }
    
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
            let ID = authResult?.user.uid
            let email = authResult?.user.email
            UserDefaults.standard.set(ID, forKey: "userID")
            UserDefaults.standard.set(email, forKey: "email")
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
                let id = result.user.uid
                let email = result.user.email
                UserDefaults.standard.set(id, forKey: "userID")
                UserDefaults.standard.set(email, forKey: "email")
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
                
                let id = result.user.uid
                let email = result.user.email
                UserDefaults.standard.set(id, forKey: "userID")
                UserDefaults.standard.set(email, forKey: "email")
                completion(.success(true))
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
    
    func saveHistoricalRound(_ user: User, _ round: Round, completion: @escaping (Result<User, FirebaseError>) -> Void) {
        reference.child("users").child(user.userID).child(round.uuid).updateChildValues(user.userData) { error,
            reference in
            if let error = error {
                print(error)
                completion(.failure(.firebaseError(error)))
            }
            UserDefaults.standard.set(user.userID, forKey: "historicalRounds")
            completion(.success(user))
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
    
    func deleteUserFromFirebase(with userID: String) {
        reference.child("users").child(userID).removeValue()
    }
    
    func fetchUser(completion: @escaping (Result<User, FirebaseError>) -> Void) {
        let currentUser = UserDefaults.standard.string(forKey: "userID")
        reference.child("users").child(currentUser!).getData { error, snapshot in
            if let error = error {
                completion(.failure(.firebaseError(error)))
                return
            }
            guard let data = snapshot?.value as? [String : Any]
            else {
                completion(.failure(.noDataFound))
                return
            }
            guard let currentUser = User(from: data) else {
                completion(.failure(.noDataFound))
                return
            }
            completion(.success(currentUser))
        }
    }
    
    func deleteUser(user: User) {
        reference.child("users").child(user.email).removeValue()
        reference.child("users").child(user.userID).removeValue()
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
    
}
