//
//  HangManImage.swift
//  Hangman (Project 7-9)
//
//  Created by Nadya Postriganova on 22/4/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import UIKit

class HangManImage {
   var currentBodyPart = 0
   var bodyParts: [UIImageView] = []
  
  init(bodyParts: [UIImageView] = []) {
    self.bodyParts = bodyParts
    for part in bodyParts {
      part.isHidden = true
    }
  }
  
  func showBodyPart() {
    if currentBodyPart >= bodyParts.count {
      return
    }
    bodyParts[currentBodyPart].isHidden = false
   
    currentBodyPart += 1
    
  }
}
