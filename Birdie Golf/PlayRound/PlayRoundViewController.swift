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
    
    @IBOutlet weak var holeOneButton: UIButton!
    @IBOutlet weak var holeTwoButton: UIButton!
    @IBOutlet weak var holeThreeButton: UIButton!
    @IBOutlet weak var holeFourButton: UIButton!
    @IBOutlet weak var holeFiveButton: UIButton!
    @IBOutlet weak var holeSixButton: UIButton!
    @IBOutlet weak var holeSevenButton: UIButton!
    @IBOutlet weak var holeEightButton: UIButton!
    @IBOutlet weak var holeNineButton: UIButton!
    @IBOutlet weak var holeTenButton: UIButton!
    @IBOutlet weak var holeElevenButton: UIButton!
    @IBOutlet weak var holeTwelveButton: UIButton!
    @IBOutlet weak var holeThirteenButton: UIButton!
    @IBOutlet weak var holeFourteenButton: UIButton!
    @IBOutlet weak var holeFifteenButton: UIButton!
    @IBOutlet weak var holeSixteenButton: UIButton!
    @IBOutlet weak var holeSeventeenButton: UIButton!
    @IBOutlet weak var holeEighteenButton: UIButton!
    
    
    var viewModel: PlayRoundViewModel!
    
    private var golferViews: [UIView] = []
    private var golferNameLabels: [UILabel] = []
    private var puttTextFields: [UITextField] = []
    private var strokeTextFields: [UITextField] = []
    private var currentScoreLabels: [UILabel] = []
    
//    var currentSelectedHoleIndex: Int = 0
    var currentHole = 0
    var par: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchCurrentRound()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        golferViews = [firstGolferView, secondGolferView, thirdGolferView, fourthGolferView]
        golferNameLabels = [firstGolferNameLabel, secondGolferNameLabel, thirdGolferNameLabel, fourthGolferNameLabel]
        currentScoreLabels = [firstGolferCurrentScoreLabel, secondGolferCurrentScoreLabel, thirdGolferCurrentScoreLabel, fourthGolferCurrentScoreLabel]
        puttTextFields = [firstGolferPuttsTextField, secondGolferPuttsTextField, thirdGolferPuttsTextField, fourthGolferPuttsTextField]
        strokeTextFields = [firstGolferStrokesTextField, secondGolferStrokesTextField, thirdGolferStrokesTextField, fourthGolferStrokesTextField]
        
//        holeOneButton.setTitleColor(.white, for: .selected)
//        holeNumberLabel.text = "\(currentSelectedHoleIndex)"
        
        self.viewModel = PlayRoundViewModel(delegate: self)
        
        viewModel.fetchCurrentRound()
        
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
    // logic should not be done on the viewController
    private func populateGolferData() {
        
        var golferIndex = 0
        // fix force unwrap
        courseNameLabel.text = viewModel.round?.courseName
        holeNumberLabel.text = "\(currentHole + 1)"
        parSelectionSegmentedControl.selectedSegmentIndex = viewModel.round!.golfers[0].holes[currentHole].par - 3
        for golfer in viewModel.round!.golfers {
            //unhide the view of the golfer that it is tied to
            golferViews[golferIndex].isHidden = false
            // populate the labels.
            golferNameLabels[golferIndex].text = golfer.golferName
            currentScoreLabels[golferIndex].text = "\(golfer.currentScore)"
            puttTextFields[golferIndex].text = "\(golfer.holes[currentHole].putts)"
            strokeTextFields[golferIndex].text = "\(golfer.holes[currentHole].strokes)"
            golferIndex += 1
        }
    }
    
    @IBAction func parSelectionSegmentedControl(_ sender: Any) {
       
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
        viewModel.updateRound(currentHole: currentHole, golfersPutts: golfersPutts, golfersStrokes: golfersStrokes, currentGolferScores: currentGolferScores, par: par)
    }
    
    @IBAction func holeButtonTapped(_ sender: UIButton) {
        currentHole = sender.tag
        sender.isHighlighted = true
        sender.backgroundColor = .yellow
        self.populateGolferData()
        
    }
    
}
extension PlayRoundViewController: PlayRoundViewModelDelegate {
    func updateViews() {
        populateGolferData()
    }
}
