//
//  ChatViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/1/22.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {

                let alertController = UIAlertController(title: "Chat feature coming soon!", message: "Click ok and get back to enjoying your golf round.", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(confirmAction)
                self.present(alertController, animated: true, completion: nil)
                return
    //        let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
    //        let playViewController = storyboard.instantiateViewController(withIdentifier: "TabBarMain")
            }

}



