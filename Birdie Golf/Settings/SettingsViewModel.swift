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
    
    
    init(service: FirebaseSyncable = FirebaseService(), delegate: SettingsViewModelDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func logOut() {
        service.logoutUser()
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "activeRoundId")
    }
    
    
    
}
