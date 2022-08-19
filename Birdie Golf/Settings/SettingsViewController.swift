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
    viewModel = SettingsViewModel(delegate: self)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        viewModel.logOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "CreateAcctID")
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
        
    }
    
    func presentFinishedRoundConfirmationAlert() {
        let alertFinishedRound = UIAlertController(title: "Finished with your Round?", message: "Do you want to save this Round?", preferredStyle: .alert)
        alertFinishedRound.addAction(UIAlertAction(title: "No", style: .default, handler: { (_) in
            UserDefaults.standard.removeObject(forKey: "activeRoundId")
            let storyboard = UIStoryboard(name: "Pre-game", bundle: nil)
            let preGameViewController =
            storyboard.instantiateViewController(withIdentifier: "PregameView")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: preGameViewController )
        }))
        alertFinishedRound.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            self.viewModel.completeRound { result in
                switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
                }
            }
        }))
        alertFinishedRound.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertFinishedRound, animated: true, completion: nil)
    }
    @IBAction func deleteAccountButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Delete account?", message: "Are you sure that you want to proceed?", preferredStyle: .alert)
        let declineAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.viewModel.deleteAccount()
            }
        alertController.addAction(confirmAction)
        alertController.addAction(declineAction)
        present(alertController, animated: true)
        
        }
    }


extension SettingsViewController: SettingsViewModelDelegate {
    func roundSavedSuccessfully() {
       
    }
    
    
}
