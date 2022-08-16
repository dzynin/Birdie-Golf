//
//  LeaderboardViewController.swift
//  Birdie Golf
//
//  Created by Isiah Parra on 8/10/22.
//

import UIKit

class LeaderboardViewController: UIViewController {

    
    @IBOutlet weak var leaderboardTableView: UITableView!
    
    
    var viewModel: LeaderboardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardTableView.dataSource = self
        viewModel = LeaderboardViewModel(delegate: self)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func optionsBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "SettingsView")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LeaderboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userScoreArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardCell", for: indexPath) as? LeaderboardTableViewCell else {
            return UITableViewCell()
        }
        let golfer = viewModel.userScoreArray[indexPath.row]
        cell.updateViews(with: golfer)
        return cell
    }


}

extension LeaderboardViewController: LeaderboardViewModelDelegate {
    func updateViews() {
        self.leaderboardTableView.reloadData()
    }
    
    
}
