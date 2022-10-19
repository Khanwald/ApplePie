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
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining:
                                incorrectMovesAllowed, guessedLetters: [])
            
            updateUI()
            reset(true)
        }
        else{
            reset(false)
        }
     }
    
    func updateUI(){
        correctWordLabel.text = currentGame.formatedWord
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        won()
        

    }
    func won(){
        if currentGame.formatedWord == currentGame.word{
            totalWins += 1
            newRound()
                    }
        else if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
            newRound()
        }
    }
    
    func reset(_ b:Bool){
        for a in letterButtons{
            a.isEnabled = b
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        var letterString = " "
        if let a = sender.titleLabel?.text{
            letterString = a
        }
        let letter = Character(letterString.lowercased())
        currentGame.playerGuess(letter: letter)
    
        
        updateUI()
        
    }
    
}

