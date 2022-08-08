//
//  FirebaseService.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/4/22.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

enum FirebaseError: Error {
    case firebaseError(Error)
    case failedToUnwrapData
    case noDataFound
}

protocol FirebaseSyncable {
    func signIn(with email: String, password: String, completion: @escaping (Result<Bool,FirebaseError>) -> Void)
    func createAccount(with email: String, password: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void )
    func signInWithApple(token: String, nonce: String)
}

struct FirebaseService: FirebaseSyncable {
    let storage = Storage.storage().reference()
    
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
                UserDefaults.standard.set(result.user.uid, forKey: "userID")
            case .none:
                if let error = error {
                    completion(.failure(.firebaseError(error)))
                }
            }
        }
    }
    
}
