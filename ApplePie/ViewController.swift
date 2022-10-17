//
//  ViewController.swift
//  ApplePie
//
//  Created by 11k on 10/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    // variables
    var letter:String = " "
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    
    var totalLosses = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    var currentGame: Game!
    
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining:
        incorrectMovesAllowed)
        updateUI()

     }
    
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree  \(currentGame.incorrectMovesRemaining)")

    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        if let text = sender.titleLabel?.text {
            letter = text
        }
        
    }
    
}

