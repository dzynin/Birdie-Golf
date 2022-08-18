//
//  ScorecardViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/1/22.
//

import UIKit

class ScorecardViewController: UIViewController {

    @IBOutlet weak var holesPar: UILabel!
    @IBOutlet weak var golfer1: UILabel!
    @IBOutlet weak var golfer2: UILabel!
    @IBOutlet weak var golfer3: UILabel!
    @IBOutlet weak var golfer4: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ScorecardViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ScorecardViewModel(delegate: self)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        initialViewSetUp()
    }
    
    private func initialViewSetUp() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        tableView.isHidden = true
    }
    
    private func loadViewWithRoundData() {
        activityIndicator.stopAnimating()
        tableView.isHidden = false
        tableView.reloadData()
    }

}

extension ScorecardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowsData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "scorecardCell", for: indexPath) as? ScorecardTableViewCell,
              let rowData = viewModel?.rowsData[indexPath.row]
        else { return ScorecardTableViewCell() }
        
        cell.updateViews(with: rowData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ScorecardHeaderView(golfers: viewModel?.round?.golfers ?? [])
        return header
    }
}

extension ScorecardViewController: ScorecardViewModelDelegate {
    func roundLoadedSuccessfully() {
        loadViewWithRoundData()
    }
}
