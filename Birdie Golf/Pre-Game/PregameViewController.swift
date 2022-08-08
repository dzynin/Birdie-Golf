//
//  PregameViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/8/22.
//

import UIKit

class PregameViewController: UIViewController {

    var rounds: [Round]?
    
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
    @IBAction func startRoundButtonTapped(_ sender: Any) {
    }
    
    @IBAction func joinRoundButtonTapped(_ sender: Any) {
    }
}

extension PregameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rounds?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roundCell", for: indexPath)
        guard let rounds = rounds else { return UITableViewCell() }
        let round = rounds[indexPath.row]
        cell.textLabel?.text = round.courseName
//        cell.detailTextLabel?.text = String(round.date)
        return cell
    }
    
    
}
