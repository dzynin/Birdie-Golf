//
//  PlayRoundViewController.swift
//  Birdie Golf
//
//  Created by Scott Cox on 8/9/22.
//

import UIKit

class PlayRoundViewController: UIViewController {
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet weak var holeNumberLabel: UILabel!
    @IBOutlet weak var parSelectionSegmentedControl: UISegmentedControl!
    
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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: PlayRoundViewModel!
    
    private var golferViews: [UIView] = []
    private var golferNameLabels: [UILabel] = []
    private var puttTextFields: [UITextField] = []
    private var strokeTextFields: [UITextField] = []
    private var currentScoreLabels: [UILabel] = []
    private var holeButtonsArray: [UIButton] = []
    //    private var currentSelectedHoleTag: Int = 0
    
    var currentHoleNumber = 1
    var par: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        //     viewModel.fetchCurrentRound()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = PlayRoundViewModel(delegate: self)
        viewModel.fetchCurrentRound()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HoleNumberCell.nib, forCellWithReuseIdentifier: HoleNumberCell.reuseId)
    }
    
    private func setUpView() {
        showCurrentNumberOfHoles()
        courseNameLabel.text = viewModel.round?.courseName
        holeNumberLabel.text = "\(currentHoleNumber)"
        
        golferViews = [firstGolferView, secondGolferView, thirdGolferView, fourthGolferView]
        golferNameLabels = [firstGolferNameLabel, secondGolferNameLabel, thirdGolferNameLabel, fourthGolferNameLabel]
        currentScoreLabels = [firstGolferCurrentScoreLabel, secondGolferCurrentScoreLabel, thirdGolferCurrentScoreLabel, fourthGolferCurrentScoreLabel]
        puttTextFields = [firstGolferPuttsTextField, secondGolferPuttsTextField, thirdGolferPuttsTextField, fourthGolferPuttsTextField]
        strokeTextFields = [firstGolferStrokesTextField, secondGolferStrokesTextField, thirdGolferStrokesTextField, fourthGolferStrokesTextField]
        holeButtonsArray = []
        
        firstGolferView.isHidden = true
        firstGolferNameLabel.layer.borderWidth = 2.0
        firstGolferNameLabel.layer.cornerRadius = 8
        firstGolferNameLabel.layer.borderColor = UIColor.black.cgColor
        
        firstGolferCurrentScoreLabel.layer.borderWidth = 2.0
        firstGolferCurrentScoreLabel.layer.cornerRadius = 8
        firstGolferCurrentScoreLabel.layer.borderColor = UIColor.black.cgColor
        
        secondGolferView.isHidden = true
        secondGolferNameLabel.layer.borderWidth = 2.0
        secondGolferNameLabel.layer.cornerRadius = 8
        secondGolferNameLabel.layer.borderColor = UIColor.black.cgColor
        
        secondGolferCurrentScoreLabel.layer.borderWidth = 2.0
        secondGolferCurrentScoreLabel.layer.cornerRadius = 8
        secondGolferCurrentScoreLabel.layer.borderColor = UIColor.black.cgColor
        
        thirdGolferView.isHidden = true
        thirdGolferNameLabel.layer.borderWidth = 2.0
        thirdGolferNameLabel.layer.cornerRadius = 8
        thirdGolferNameLabel.layer.borderColor = UIColor.black.cgColor
        
        thirdGolferCurrentScoreLabel.layer.borderWidth = 2.0
        thirdGolferCurrentScoreLabel.layer.cornerRadius = 8
        thirdGolferCurrentScoreLabel.layer.borderColor = UIColor.black.cgColor
        
        fourthGolferView.isHidden = true
        fourthGolferNameLabel.layer.borderWidth = 2.0
        fourthGolferNameLabel.layer.cornerRadius = 8
        fourthGolferNameLabel.layer.borderColor = UIColor.black.cgColor
        
        fourthGolferCurrentScoreLabel.layer.borderWidth = 2.0
        fourthGolferCurrentScoreLabel.layer.cornerRadius = 8
        fourthGolferCurrentScoreLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    private func showCurrentNumberOfHoles() {
        if viewModel.numberOfHoles() == 9 {
        }
    }
    
    private func populateGolferData() {
        var golferIndex = 0
        // fix force unwrap
        
        parSelectionSegmentedControl.selectedSegmentIndex = viewModel.round!.golfers[0].holes[currentHoleNumber - 1].par - 3
        for golfer in viewModel.round!.golfers {
            //unhide the view of the golfer that it is tied to
            golferViews[golferIndex].isHidden = false
            // populate the labels.
            golferNameLabels[golferIndex].text = golfer.golferName
            currentScoreLabels[golferIndex].text = "\(golfer.currentScore)"
            puttTextFields[golferIndex].text = "\(golfer.holes[currentHoleNumber - 1].putts)"
            strokeTextFields[golferIndex].text = "\(golfer.holes[currentHoleNumber - 1].strokes)"
            golferIndex += 1
        }
    }
    
    @IBAction func parSelectionSegmentedControl(_ sender: Any) {
        parSelectionSegmentedControl.selectedSegmentTintColor = UIColor(named: "AccentColor")
        parSelectionSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
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
    
    
    @IBAction func SaveHoleInfoButtonTapped(_ sender: Any) {
        // Update the current Hole...
        if parSelectionSegmentedControl.selectedSegmentIndex != 0 && parSelectionSegmentedControl.selectedSegmentIndex != 1 && parSelectionSegmentedControl.selectedSegmentIndex != 2 {
            let alertController = UIAlertController(title: "Missing par value!", message: "Please selct a par for the current hole.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        var golfersPutts: [String] = []
        var golfersStrokes: [String] = []
        var currentGolferScores: [Int] = []
        
        
        if let golferOnePutts = firstGolferPuttsTextField.text, let golferTwoPutts = secondGolferPuttsTextField.text, let golferThreePutts = thirdGolferPuttsTextField.text, let golferFourPutts = fourthGolferPuttsTextField.text {
            golfersPutts.append(golferOnePutts)
            golfersPutts.append(golferTwoPutts)
            golfersPutts.append(golferThreePutts)
            golfersPutts.append(golferFourPutts)
        }
        if let golferOneStrokes = firstGolferStrokesTextField.text, let golferTwoStrokes = secondGolferStrokesTextField.text, let golferThreeStrokes = thirdGolferStrokesTextField.text, let golferfourStrokes = fourthGolferStrokesTextField.text {
            
            par = parSelectionSegmentedControl.selectedSegmentIndex + 3
            
            let golferOneStrokeInt = Int(golferOneStrokes) ?? 0
            let golferTwoStrokeInt = Int(golferTwoStrokes) ?? 0
            let golferThreeStrokeInt = Int(golferThreeStrokes) ?? 0
            let golferFourStrokeInt = Int(golferfourStrokes) ?? 0
            golfersStrokes.append(golferOneStrokes)
            golfersStrokes.append(golferTwoStrokes)
            golfersStrokes.append(golferThreeStrokes)
            golfersStrokes.append(golferfourStrokes)
            currentGolferScores.append(golferOneStrokeInt - par)
            currentGolferScores.append(golferTwoStrokeInt - par)
            currentGolferScores.append(golferThreeStrokeInt - par)
            currentGolferScores.append(golferFourStrokeInt - par)
            
        }
        viewModel.updateRound(currentHole: currentHoleNumber - 1, golfersPutts: golfersPutts, golfersStrokes: golfersStrokes, currentGolferScores: currentGolferScores, par: par)
    }
    
    private func setHoleButtonColors() {
        for index in 0...viewModel.numberOfHoles() - 1 {
            let hole = viewModel.round?.golfers.first?.holes[index]
//            let button = holeButtonsArray[index]
            
//            guard hole?.holeNumber != currentHoleNumber else {
//                button.backgroundColor = UIColor(named: "AccentColor")
//                button.tintColor = .white
//                continue
//            }
//
//            button.backgroundColor = hole?.hasBeenPlayed == true ? .yellow : .white
//            button.tintColor = UIColor(named: "AccentColor")
        }
    }
    
    @IBAction func holeButtonTapped(_ sender: UIButton) {
        currentHoleNumber = sender.tag
        holeNumberLabel.text = "\(currentHoleNumber)"
        setHoleButtonColors()
        populateGolferData()
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "SettingsView")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
}
extension PlayRoundViewController: PlayRoundViewModelDelegate {
    func updateViews() {
        setUpView()
        populateGolferData()
        setHoleButtonColors()
    }
}

extension PlayRoundViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfHoles()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HoleNumberCell.reuseId, for: indexPath) as? HoleNumberCell
        let hole = viewModel.round?.golfers.first?.holes[indexPath.row]
        cell?.setHole(hole, indexPath: indexPath, isCurrentHole: indexPath.row + 1 == currentHoleNumber)
        
        return cell ?? UICollectionViewCell()
    }
}

extension PlayRoundViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentHoleNumber = indexPath.row + 1
        holeNumberLabel.text = "\(currentHoleNumber)"
//        setHoleButtonColors()
//        populateGolferData()
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
}
