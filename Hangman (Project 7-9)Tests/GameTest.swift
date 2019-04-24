//
//  Word.swift
//  Hangman (Project 7-9)Tests
//
//  Created by Nadya Postriganova on 24/4/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import XCTest
@testable import Hangman__Project_7_9_

class GameTest: XCTestCase {

    override func setUp() {
      
    }

    override func tearDown() {
      
    }

  func testWord() {
    let word = Game("nadya")
    XCTAssertEqual(word.word, "nadya")
    }
  
  func testHint() {
    let word = Game("nadya")
    XCTAssertEqual(word.addHint(), "?????")
    
  }
  
  func testReceivedLetter() {
    let word = Game("nadya")
    XCTAssertEqual(word.checkLetter("a"), true)
    XCTAssertEqual(word.checkLetter("r"), false)
    XCTAssertEqual(word.addHint(), "?a??a")
    XCTAssertEqual(word.checkLetter("d"), true)
    XCTAssertEqual(word.addHint(), "?ad?a")
    
  }

  
  
    func testPerformanceExample() {
      
        self.measure {
          
        }
    }

}
