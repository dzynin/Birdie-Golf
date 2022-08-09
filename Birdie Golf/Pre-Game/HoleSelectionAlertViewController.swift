//
//  HoleSelectionAlertViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/8/22.
//

import UIKit

class HoleSelectionAlertViewController: UIViewController {

    @IBOutlet weak var courseNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nineButtonTapped(_ sender: Any) {
        
    }
    @IBAction func eighteenButtonTapped(_ sender: Any) {
    }
    @IBAction func enterRoundButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
                guard let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarMain") as? UITabBarController else { return }
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: tabBarController)
    }
}
