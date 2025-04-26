//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        ["Four + Two = Six", "True"],
        ["Five - Three > One ", "True"],
        ["Three + Eight < Ten", "False"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
            
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
//        progressBar.progress = Float(questionNumber) / Float(quiz.count)
//        
//        if questionNumber == quiz.count - 1 {
//            trueButton.isEnabled = false
//            falseButton.isEnabled = false
//        } else {
//            trueButton.isEnabled = true
//            falseButton.isEnabled = true
//        }
    }
    
}

