//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizzBrain = QuizzBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizzBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizzBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI() {
        questionLabel.text = quizzBrain.getQuestionText()
        let answers = quizzBrain.getQuestionAnswers()
        button0.setTitle(answers[0], for: .normal)
        trueButton.setTitle(answers[1], for: .normal)
        falseButton.setTitle(answers[2], for: .normal)
        progressBar.progress = quizzBrain.getProgress()
        scoreLabel.text = "Score: \(quizzBrain.getScore())"
        debugPrint("trueButton backgroundColor: \(trueButton.backgroundColor?.description ?? UIColor.clear.description)")
        
        button0.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

