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
    private var round: Round?
    private weak var delegate: SettingsViewModelDelegate?
    
    
    init(service: FirebaseSyncable = FirebaseService(), round: Round, delegate: SettingsViewModelDelegate) {
        self.service = service
        self.round = round
        self.delegate = delegate
    }
    
    func logOut() {
        service.logoutUser()
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "activeRoundId")
    }
    
    
    
}
