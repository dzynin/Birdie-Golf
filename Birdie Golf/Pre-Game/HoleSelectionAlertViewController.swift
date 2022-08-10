//
//  HoleSelectionAlertViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/8/22.
//

import UIKit

class HoleSelectionAlertViewController: UIViewController {

    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var viewModel: RoundStartViewModel = RoundStartViewModel()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancelButtonTapped(_ sender: Any) {
        closeView()
    }

    @IBAction func enterRoundButtonTapped(_ sender: Any) {
        guard let name = courseNameTextField.text, !name.isEmpty else {
            assertionFailure()
            return
        }
        
        let numberOfHoles = segmentedControl.selectedSegmentIndex == 1 ? 18 : 9
      
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
            holesArray.append(holeEighteen)
        }
        
        viewModel.startRound(with: name, numberOfHoles: numberOfHoles, holesArray: holesArray)
    }
    @objc func closeView() {
        self.dismiss(animated: true)
    }
}

extension HoleSelectionAlertViewController: RoundStartViewModelDelegate {
    func roundSuccessfullyStarted() {
        let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
        guard let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarMain") as? UITabBarController else { return }
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: tabBarController)
    }
}
