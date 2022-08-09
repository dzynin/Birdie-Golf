//
//  LeaderboardViewModel.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/8/22.
//

import Foundation

protocol LeaderboardViewModelDelegate: AnyObject {
    func updateViews()
}

class LeaderboardViewModel {
    private var round: Round?
    
    private weak var delegate: LeaderboardViewModelDelegate?
    
    init(round: Round, delegate: LeaderboardViewModelDelegate) {
        self.delegate = delegate
        self.round = round
    }
    
    func filteredUsers() {
        round!.holes.first?.
        
    }
}
