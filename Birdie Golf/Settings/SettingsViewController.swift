//
//  SettingsViewController.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/10/22.
//

import UIKit

class SettingsViewController: UIViewController {

    var viewModel: SettingsViewModel!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        viewModel.logOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainView")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: mainViewController)
        }
    
    @IBAction func closedOutBtnTapped(_ sender: Any) {
        closeView()
    }
    @objc func closeView() {
        self.dismiss(animated: true)
    }
    
    @IBAction func endRoundBtnTapped(_ sender: Any) {
        presentFinishedRoundConfirmationAlert()
        saveRoundToPreGame()
    }
    
    func presentFinishedRoundConfirmationAlert() {
        let alertFinishedRound = UIAlertController(title: "Finished with your Round?", message: "Do you want to save this Round?", preferredStyle: .alert)
        alertFinishedRound.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (_) in
            
        }))
        alertFinishedRound.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            
        }))
        self.present(alertFinishedRound, animated: true, completion: nil)
    }
    
    func saveRoundToPreGame() {
       
    
    }
    

}

extension SettingsViewController: SettingsViewModelDelegate {
    func roundSavedSuccessfully() {
       
    }
    
    
}
