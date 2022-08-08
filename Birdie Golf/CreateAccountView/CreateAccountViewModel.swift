//
//  CreateAccountViewModel.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/7/22.
//

import Foundation

protocol CreateAccountViewModelDelegate: AnyObject {
    func presentAlertController(error: Error)
    func userSignedIn()
}

class CreateAccountViewModel {
    private let service: FirebaseSyncable
    private weak var delegate: CreateAccountViewModelDelegate?
    
    init(service: FirebaseSyncable = FirebaseService(), delegate: CreateAccountViewModelDelegate) {
        self.delegate = delegate
        self.service = service
    }
    
    func createAccount(with email: String, password: String) {
        service.createAccount(with: email, password: password) { result in
            switch result {
            case .success:
                self.delegate?.userSignedIn()
            case .failure(let error):
                self.delegate?.presentAlertController(error: error)
            }
        }
    }
}
