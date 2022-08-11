//
//  AddUserViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/10/22.
//

import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var golferNameTextField: UITextField!
    
    
    var viewModel: AddUserViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
    }
    

   
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        closeView()
    }
    
    @IBAction func addGolferToRoundButtonTapped(_ sender: Any) {

        guard let golfer = golferNameTextField.text else { return }
        viewModel.fetchGolfer(with: golfer)
        closeView()
    }
    
    @objc func closeView() {
        self.dismiss(animated: true)
    }
    
}
