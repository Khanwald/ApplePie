//
//  Game.swift
//  ApplePie
//
//  Created by 11k on 10/17/22.
//
import Foundation
struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters:[Character]
    
    var formatedWord:String{
        var guessWord = ""
        
        for letter in word{
            if guessedLetters.contains(letter){
                guessWord += String(letter)
            }
            else{
                guessWord += "_"
            }
        }
        if incorrectMovesRemaining == 0{
            guessWord = " "
        }
        return guessWord
    }
    
    mutating func playerGuess(letter:Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    
}
