//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionOneLabel: UIButton!
    @IBOutlet weak var questionTwoLabel: UIButton!
    @IBOutlet weak var questionThreeLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var quizBrain = QuizBrain()

    @IBAction func checkButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        questionText.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.progressBar()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionOneLabel.setTitle(quizBrain.getFirstAnswer(), for: .normal)
        questionTwoLabel.setTitle(quizBrain.getSecondAnswer(), for: .normal)
        questionThreeLabel.setTitle(quizBrain.getThirdAnswer(), for: .normal)
        questionOneLabel.backgroundColor = UIColor.clear
        questionTwoLabel.backgroundColor = UIColor.clear
        questionThreeLabel.backgroundColor = UIColor.clear

    }
}

