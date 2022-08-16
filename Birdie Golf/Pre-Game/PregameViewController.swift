//
//  PregameViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/8/22.
//

import UIKit

class PregameViewController: UIViewController {
    
    
    
    var viewModel: PregameViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startRoundButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "HoleSelectionAlertViewController", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "holeAlert")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func joinRoundButtonTapped(_ sender: Any) {
    }
}

extension PregameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roundCell", for: indexPath)
        
        let round = viewModel.rounds[indexPath.row]
        cell.textLabel?.text = round.courseName
        //        cell.detailTextLabel?.text = String(round.date)
        return cell
    }
    
}

