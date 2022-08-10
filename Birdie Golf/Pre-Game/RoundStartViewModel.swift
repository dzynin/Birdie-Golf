//
//  RoundStartViewModel.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/9/22.
//

import Foundation

protocol RoundStartViewModelDelegate: HoleSelectionAlertViewController {
    func roundSuccessfullyStarted()
}

class RoundStartViewModel {
    let service: FirebaseSyncable
    weak var delegate: RoundStartViewModelDelegate?
    
    var holesArray: [Hole] = []
    
    var holeOne: Hole
    var holeTwo: Hole
    var holeThree: Hole
    var holeFour: Hole
    var holeFive: Hole
    var holeSix: Hole
    var holeSeven: Hole
    var holeEight: Hole
    var holeNine: Hole
    var holeTen: Hole
    var holeEleven: Hole
    var holeTwelve: Hole
    var holeThirteen: Hole
    var holeFourteen: Hole
    var holeFifteen: Hole
    var holeSixteen: Hole
    var holeSeventeen: Hole
    var holeEighteen: Hole
    
   
    init(service: FirebaseSyncable = FirebaseService()) {
        self.service = service
    }
    
    
    if numberOfHoles == 9 {
        
        holesArray.append(holeOne)
        holesArray.append(holeTwo)
        holesArray.append(holeThree)
        holesArray.append(holeFour)
        holesArray.append(holeFive)
        holesArray.append(holeSix)
        holesArray.append(holeSeven)
        holesArray.append(holeEight)
        holesArray.append(holeNine)
    } else {
        holesArray.append(holeOne)
        holesArray.append(holeTwo)
        holesArray.append(holeThree)
        holesArray.append(holeFour)
        holesArray.append(holeFive)
        holesArray.append(holeSix)
        holesArray.append(holeSeven)
        holesArray.append(holeEight)
        holesArray.append(holeNine)
        holesArray.append(holeTen)
        holesArray.append(holeEleven)
        holesArray.append(holeTwelve)
        holesArray.append(holeThirteen)
        holesArray.append(holeFourteen)
        holesArray.append(holeFifteen)
        holesArray.append(holeSixteen)
        holesArray.append(holeSeventeen)
        holesArray.append(holeEighteen
    }
                          
    func startRound(with courseName: String, numberOfHoles: Int, usersArray: [User] = [], holesArray: [Hole] = []) {
        let round = Round(courseName: courseName, numberOfHoles: numberOfHoles, holes: holesArray, users: usersArray)
        service.saveRound(round) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let round):
                print(round.courseName)
                self?.delegate?.roundSuccessfullyStarted()
            }
        }
    }
}
