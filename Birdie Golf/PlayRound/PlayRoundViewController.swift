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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        golferViews = [firstGolferView, secondGolferView, thirdGolferView, fourthGolferView]
        golferNameLabels = [firstGolferNameLabel, secondGolferNameLabel, thirdGolferNameLabel, fourthGolferNameLabel]
        puttTextFields = [firstGolferPuttsTextField, secondGolferPuttsTextField, thirdGolferPuttsTextField, fourthGolferPuttsTextField]
        strokeTextFields = [firstGolferStrokesTextField, secondGolferStrokesTextField, thirdGolferStrokesTextField, fourthGolferStrokesTextField]
        
        holeOneButton.setTitleColor(.white, for: .selected)
        
        let viewModel = PlayRoundViewModel()
        self.viewModel = viewModel
        viewModel.fetchCurrentRound {
            self.populateGolferData()
        }
        
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
        for golfer in viewModel.round!.golfers {
           //unhide the view of the golfer that it is tied to
            golferViews[golferIndex].isHidden = false
            // populate the labels.
            golferNameLabels[golferIndex].text = golfer.golferName
            puttTextFields[golferIndex].text = "\(golfer.putts)"
            strokeTextFields[golferIndex].text = "\(golfer.strokes)"
            golferIndex += 1
    }
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
    

    @IBAction func nextHoleButtonTapped(_ sender: Any) {
        // save/update data for a hole
        var scores: [Golfer] = []
        for index in 0...3 {
            if let golfer = viewModel.golfer(at: index) {
                guard let strokes = strokeTextFields[index].text, let strokesInt = Int(strokes),
                      let putts = puttTextFields[index].text, let puttsInt = Int(putts) else {
                    assertionFailure()
                    return
                }
                let score = Golfer(golferName: golfer.golferName, strokes: strokesInt, putts: puttsInt, currentScore: golfer.currentScore)
                
                scores.append(score)
            }
        }
        
        //viewModel.currentHole?.userScore = scores
        viewModel.saveHole()
    }
}
