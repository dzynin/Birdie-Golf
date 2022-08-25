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
    
    @IBOutlet weak var firstGolferTextField: UITextField!
    @IBOutlet weak var secondGolferTextField: UITextField!
    @IBOutlet weak var thirdGolferTextField: UITextField!
    @IBOutlet weak var fourthGolferTextField: UITextField!
    
    var viewModel: RoundStartViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
        self.viewModel =  RoundStartViewModel(delegate: self)
    }


    @IBAction func cancelButtonTapped(_ sender: Any) {
        closeView()
    }

    @IBAction func enterRoundButtonTapped(_ sender: Any) {
        guard let name = courseNameTextField.text, !name.isEmpty else {
            assertionFailure()
            return
        }
        
        let numberOfHoles = segmentedControl.selectedSegmentIndex == 1 ? 18 : 9
        
        var golfers: [String] = []
        
        if let firstGolfer = firstGolferTextField.text?.capitalized, !firstGolfer.isEmpty {
            golfers.append(firstGolfer)
        }
        if let secondGolfer = secondGolferTextField.text?.capitalized, !secondGolfer.isEmpty {
            golfers.append(secondGolfer)
        }
        if let thirdGolfer = thirdGolferTextField.text?.capitalized, !thirdGolfer.isEmpty {
            golfers.append(thirdGolfer)
        }
        if let fourthGolfer = fourthGolferTextField.text?.capitalized, !fourthGolfer.isEmpty {
            golfers.append(fourthGolfer)
        }
       
        viewModel.createRound(with: name, numberOfHoles: numberOfHoles, golferNames: golfers)
    }
    @objc func closeView() {
        self.dismiss(animated: true)
    }
}

extension HoleSelectionAlertViewController: RoundStartViewModelDelegate {
    func roundSuccessfullyStarted() {
        // capture the first view controller on the tabBar and type cast it as the "Play" view controller and present it.
        let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
        guard let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarMain") as? UITabBarController else { return }
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: tabBarController)
    }
}
