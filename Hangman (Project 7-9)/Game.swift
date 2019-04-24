//
//  word.swift
//  Hangman (Project 7-9)
//
//  Created by Nadya Postriganova on 23/4/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation

class Game {
  
  var word: String
  var enteredLetters: Set<String> = []
  var wrongAnswers = 0
  
  init(_ word: String = "") {
    self.word = word
  }

  func addHint() -> String {
    var wordWithHints = ""
    for letter in word {
      let stringLetter = String(letter)
      if enteredLetters.contains(stringLetter) {
        wordWithHints += stringLetter
      }else {
        wordWithHints += "?"
        wrongAnswers += 1
      }
    }
    return wordWithHints
  }
  
  func checkLetter(_ charecter: String) -> Bool {
    if word.contains(charecter) {
      enteredLetters.insert(charecter)
      return true
    } else {
      return false
    }
  }
  
 

}




