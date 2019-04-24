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
//  var usedLetters = [Character]()
  var wrongAnswers = 0
  
  @IBOutlet var rope: UIImageView!
  @IBOutlet var head: UIImageView!
  @IBOutlet var body: UIImageView!
  @IBOutlet var rightArm: UIImageView!
  @IBOutlet var leftArm: UIImageView!
  @IBOutlet var rightLeg: UIImageView!
  @IBOutlet var leftLeg: UIImageView!
  
//  @IBAction func show(_ sender: Any) {
//    hangMan.showBodyPart()
//  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    hangMan = HangManImage(bodyParts: [rope, head, body, rightArm, leftArm, rightLeg, leftLeg])
  
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
    if answer.count == 1 && wrongAnswers < 7 {
      if !currentWord.checkLetter(answer) {
        hangMan.showBodyPart()
//      title = currentWord.addHint()
        wrongAnswers += 1
      } else {
        title = currentWord.addHint()
      }
    }
  }
  
  @objc func startGame() {
    currentWord = Game(allWords.randomElement() ?? "No word found")
    title = currentWord.addHint()
  }

}

