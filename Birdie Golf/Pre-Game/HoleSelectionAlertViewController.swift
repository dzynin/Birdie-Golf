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
        let userScore = 0
        let numberofGolfers = 4
        
        viewModel.fetchNumberOfGolfers(numberOfGolfers: numberofGolfers)
        viewModel.fetchNumberOfHoles(numberOfHoles: numberOfHoles)
        viewModel.startRound(with: name, numberOfHoles: numberOfHoles)
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
