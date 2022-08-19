//
//  SettingsViewModel.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/10/22.
//

import Foundation
protocol SettingsViewModelDelegate: SettingsViewController {
    func roundSavedSuccessfully()
}

class SettingsViewModel {
    private var service: FirebaseSyncable
    private weak var delegate: SettingsViewModelDelegate?
    var round: Round?
    
    init(service: FirebaseSyncable = FirebaseService(), delegate: SettingsViewModelDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func logOut() {
        service.logoutUser()
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "activeRoundId")
        UserDefaults.standard.removeObject(forKey: "userID")
    }
    
    func completeRound(completion: @escaping(Result<Bool, FirebaseError>) -> Void) {
        // we need to fetch the current round
        service.fetchRound { result in
            switch result {
            case .success(let round):
                let roundArray = [round]
               guard let id = UserDefaults.standard.string(forKey: "userID"),
                        let email = UserDefaults.standard.string(forKey: "email") else { return }
                let user = User(userID: id, email: email, historicalRounds: roundArray)
                self.service.saveUserToFirebase(with: user) { result in
                    switch result {
                    case .success(let success):
                        self.delegate?.roundSavedSuccessfully()
                        completion(.success(success))
                    case .failure(let failure):
                        completion(.failure(failure))
                    }
                }
        case .failure(let error):
            completion(.failure(.firebaseError(error)))
        }
    }
    // we need to fetch and save the round to the user
    // remove active roundID
    // inform the viewController to send them back to the pregame screen
}



}
