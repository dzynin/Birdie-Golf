//
//  PregameViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/8/22.
//

import UIKit

class PregameViewController: UIViewController {

    @IBOutlet var holesNib: UIView!
    
    var viewModel: PregameViewModel!
    
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
//    @objc private func startRoundAlert() {
//        
//        let alert = UIAlertController(title: "Course Name", message: "What course are you playing today?", preferredStyle: .alert)
//        alert.addTextField { field in
//            field.placeholder = "Course name..."
//            field.returnKeyType = .continue
//        }
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "Start Round", style: .default, handler: { _ in
//            guard let field = alert.textFields else { return }
//            let courseField = field[0]
//            guard let course = courseField.text, !course.isEmpty else {
//                print("Invalid course entry")
//                return
//            }
//        }))
//     present(alert, animated: true)
//    }
    
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

