//
//  SignInViewController.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 7/28/22.
//

import UIKit
import AuthenticationServices
import CryptoKit

class SignInViewController: UIViewController {
    
    
    
    @IBOutlet weak var textFieldStackView: UIStackView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: SignInViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSignInWithAppleProvider()
        viewModel = SignInViewModel(delegate: self)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if emailTextField.text?.isEmpty == true {
            print("No text entered in email text box")
            let alertController = UIAlertController(title: "Oops an Error has occured, Email text field is empty", message: "Please enter vaild Email", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(confirmAction)
            self.present(alertController,animated: true, completion: nil)
            return
        }
        if passwordTextField.text?.isEmpty == true {
            print("No text entered in email text box")
            let alertController = UIAlertController(title: "Oops an Error has occured, Password text field is empty", message: "Please enter vaild Password", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
        }
        guard let password = passwordTextField.text,
              let email = emailTextField.text else { return }
        viewModel.signIn(with: email, password: password)
        let storyboard = UIStoryboard(name: "Pre-game", bundle: nil)
        let preGameView = storyboard.instantiateViewController(withIdentifier: "PregameView")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: preGameView)
        
    }
    
    
    func setUpSignInWithAppleProvider() {
        let authorizationButton = ASAuthorizationAppleIDButton()
        authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        textFieldStackView.insertArrangedSubview(authorizationButton, at: 2)
    }
    
    func performExistingAccountSetupFlows() {
        // Prepare requests for both Apple ID and password providers.
        let requests = [ASAuthorizationAppleIDProvider().createRequest(),
                        ASAuthorizationPasswordProvider().createRequest()]
        
        // Create an authorization controller with the given requests.
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc
    func handleAuthorizationAppleButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    
}// End of Class

extension SignInViewController: SignInViewModelDelegate {
    func presentAlertController(error: Error) {
        let alertController = UIAlertController(title: "No Account found", message: "Please check Email and Password", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    func userSignedIn() {
        let storyboard = UIStoryboard(name: "Pre-game", bundle: nil)
        let preGameView = storyboard.instantiateViewController(withIdentifier: "PregameView")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: preGameView)
    }
}

extension SignInViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
        
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = viewModel.currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: (appleIDToken.debugDescription)")
                return
            }
            viewModel.signInWithApple(token: idTokenString, nonce: nonce)
        }
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
    }
    
}

@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}
