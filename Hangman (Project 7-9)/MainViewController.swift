//
//  ViewController.swift
//  Hangman (Project 7-9)
//
//  Created by Nadya Postriganova on 22/4/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  var hangMan = HangManImage()
  var allWords = [String]()
  var currentWord = Game()

  var wrongAnswers = 0
 
  
  @IBOutlet var rope: UIImageView!
  @IBOutlet var head: UIImageView!
  @IBOutlet var body: UIImageView!
  @IBOutlet var rightArm: UIImageView!
  @IBOutlet var leftArm: UIImageView!
  @IBOutlet var rightLeg: UIImageView!
  @IBOutlet var leftLeg: UIImageView!
  
  @IBOutlet var scoreLable: UILabel!

  
  override func viewDidLoad() {
    super.viewDidLoad()

    if let wordsFileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
      if let wordsContent = try? String(contentsOf: wordsFileURL) {
        allWords = wordsContent.components(separatedBy: "\n")
      }
    }
   navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptAnswer))
   navigationItem.leftBarButtonItem  = UIBarButtonItem(title: "New word", style: .plain, target: self, action: #selector(startGame))
    
    
    if allWords.isEmpty {
      allWords = ["silkworm"]
    }
    startGame()
  }
    
  
  @objc func promptAnswer() {
    let ac = UIAlertController(title: "Gueas a letter", message: nil, preferredStyle: .alert)
    ac.addTextField()
    let submitAction = UIAlertAction(title: "Try", style: .default) { [weak self, weak ac] _ in
      guard let answer = ac?.textFields?[0].text else { return }
      self?.submit(answer)
    }
    ac.addAction(submitAction)
    present(ac, animated: true)
  }
  
  func submit(_ answer: String) {
    if answer.count == 1 {
      if !currentWord.checkLetter(answer) {
        hangMan.showBodyPart()
        if currentWord.gameOver() {
          let ac = UIAlertController(title: "Game Over", message: nil, preferredStyle: .alert)
          let action = UIAlertAction(title: "Ok", style: .default)
          ac.addAction(action)
          present(ac, animated: true)
          self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
      } else {
        if currentWord.gameWon() {
          let ac = UIAlertController(title: "Congratulations", message: "You guessed the word", preferredStyle: .alert)
          let action = UIAlertAction(title: "Ok", style: .default)
          ac.addAction(action)
          present(ac, animated: true)
          self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
      }
    }
    title = currentWord.addHint()
    scoreLable.text = "Score: \(currentWord.score)"
  }
  
  @objc func startGame() {
    hangMan = HangManImage(bodyParts: [rope, head, body, rightArm, leftArm, rightLeg, leftLeg])
    currentWord = Game(allWords.randomElement()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "No word found")
    
    print(currentWord.word)
    
    title = currentWord.addHint()
    scoreLable.text = "Score: \(currentWord.score)"
    self.navigationItem.rightBarButtonItem?.isEnabled = true
  }

}

