//
//  PlayRoundViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/9/22.
//

import UIKit

class PlayRoundViewController: UIViewController {

    @IBOutlet weak var firstGolferView: UIView!
    @IBOutlet weak var firstGolferNameLabel: UILabel!
    @IBOutlet weak var firstGolferCurrentScoreLabel: UILabel!
    @IBOutlet weak var firstGolferPuttsTextField: UITextField!
    @IBOutlet weak var firstGolferStrokesTextField: UITextField!
    @IBOutlet weak var firstGolferHoleDataStackView: UIStackView!
    
    @IBOutlet weak var secondGolferView: UIView!
    @IBOutlet weak var secondGolferNameLabel: UILabel!
    @IBOutlet weak var secondGolferCurrentScoreLabel: UILabel!
    @IBOutlet weak var secondGolferPuttsTextField: UITextField!
    @IBOutlet weak var secondGolferStrokesTextField: UITextField!
    @IBOutlet weak var secondGolferHoleDataStackView: UIStackView!
    
    @IBOutlet weak var thirdGolferView: UIView!
    @IBOutlet weak var thirdGolferNameLabel: UILabel!
    @IBOutlet weak var thirdGolferCurrentScoreLabel: UILabel!
    @IBOutlet weak var thirdGolferPuttsTextField: UITextField!
    @IBOutlet weak var thirdGolferStrokesTextField: UITextField!
    @IBOutlet weak var thirdGolferHoleDataStackView: UIStackView!
    
    @IBOutlet weak var fourthGolferView: UIView!
    @IBOutlet weak var fourthGolferNameLabel: UILabel!
    @IBOutlet weak var fourthGolferPuttsTextField: UITextField!
    @IBOutlet weak var fourthGolferCurrentScoreLabel: UILabel!
    @IBOutlet weak var fourthGolferStrokesTextField: UITextField!
    @IBOutlet weak var fourthGolferHoleDataStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstGolferNameLabel.layer.borderWidth = 2.0
        firstGolferNameLabel.layer.cornerRadius = 8
        firstGolferNameLabel.layer.borderColor = UIColor.black.cgColor
 
        firstGolferCurrentScoreLabel.layer.borderWidth = 2.0
        firstGolferCurrentScoreLabel.layer.cornerRadius = 8
        firstGolferCurrentScoreLabel.layer.borderColor = UIColor.black.cgColor
            
        
        secondGolferNameLabel.layer.borderWidth = 2.0
        secondGolferNameLabel.layer.cornerRadius = 8
        secondGolferNameLabel.layer.borderColor = UIColor.black.cgColor
 
        secondGolferCurrentScoreLabel.layer.borderWidth = 2.0
        secondGolferCurrentScoreLabel.layer.cornerRadius = 8
        secondGolferCurrentScoreLabel.layer.borderColor = UIColor.black.cgColor
            
        
        thirdGolferNameLabel.layer.borderWidth = 2.0
        thirdGolferNameLabel.layer.cornerRadius = 8
        thirdGolferNameLabel.layer.borderColor = UIColor.black.cgColor
 
        thirdGolferCurrentScoreLabel.layer.borderWidth = 2.0
        thirdGolferCurrentScoreLabel.layer.cornerRadius = 8
        thirdGolferCurrentScoreLabel.layer.borderColor = UIColor.black.cgColor
            
        
        fourthGolferNameLabel.layer.borderWidth = 2.0
        fourthGolferNameLabel.layer.cornerRadius = 8
        fourthGolferNameLabel.layer.borderColor = UIColor.black.cgColor
 
        fourthGolferCurrentScoreLabel.layer.borderWidth = 2.0
        fourthGolferCurrentScoreLabel.layer.cornerRadius = 8
        fourthGolferCurrentScoreLabel.layer.borderColor = UIColor.black.cgColor
            
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addUsersButtonTapped(_ sender: Any) {
        
            let storyboard = UIStoryboard(name: "AddUserView", bundle: nil)
            let userAlert = storyboard.instantiateViewController(withIdentifier: "userAlert")
            userAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            userAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(userAlert, animated: true, completion: nil)
        }
    
    @IBAction func firstGolferHoleDataInputButtonTapped(_ sender: Any) {
        firstGolferHoleDataStackView.isHidden.toggle()
    }
    @IBAction func secondGolferHoleDataInputButtonTapped(_ sender: Any) {
        secondGolferHoleDataStackView.isHidden.toggle()
    }
    @IBAction func thirdGolferHoleDataInputButtonTapped(_ sender: Any) {
        thirdGolferHoleDataStackView.isHidden.toggle()
    }
    @IBAction func fourthGolferHoleDataInputButtonTapped(_ sender: Any) {
        fourthGolferHoleDataStackView.isHidden.toggle()
    }
    
}
