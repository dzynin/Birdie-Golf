//
//  CreateAccountViewController.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/8/22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reTypePasswordTextField: UITextField!
    
    var viewModel: CreateAccountViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CreateAccountViewModel(delegate: self)
        // Do any additional setup after loading the view.
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        if emailTextField.text?.isEmpty == true {
            print("No text entered for Email")
            let alertController = UIAlertController(title: "Error has occured, Email text field empty", message: "Please enter a valid Email", preferredStyle: .actionSheet)
            let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        if passwordTextField.text?.isEmpty == true {
            print("No text has been entered for a Password")
            let alertController = UIAlertController(title: "Error has occured, Password is empty", message: "Please enter a valid Password", preferredStyle: .actionSheet)
            let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
        }
        if reTypePasswordTextField.text?.isEmpty == true {
            print("No text has been entered to confirm Password")
            let alertController = UIAlertController(title: "Error has occured, Password confirmation is empty", message: "Please enter the valid Password", preferredStyle: .actionSheet)
            let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
        }
        if passwordTextField.text != reTypePasswordTextField.text {
            print("Looks like your Password dosen't match, please check and make sure they are correct")
            let alertController = UIAlertController(title: "Oops looks like your Password dosen't match", message: "Please make sure your Passwords are correct", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
        }
        guard let password = passwordTextField.text,
              let email = emailTextField.text else { return }
        viewModel.createAccount(with: email, password: password)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}// end of class

extension CreateAccountViewController: CreateAccountViewModelDelegate {
    
    func userSignedIn() {
        let storyboard = UIStoryboard(name: "Pre-game", bundle: nil)
        let preGameView = storyboard.instantiateViewController(withIdentifier: "PregameView")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: preGameView)
    }
    func presentAlertController(error: Error) {
        let alertController = UIAlertController(title: "Error", message: "(error.localizedDescription)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel))
        present(alertController, animated: true)
    }
    
    
}
