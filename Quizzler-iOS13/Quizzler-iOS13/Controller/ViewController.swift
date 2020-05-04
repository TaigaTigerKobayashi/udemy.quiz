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
    
    @IBOutlet weak var answerButton0: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

        @IBAction func answerButtonPressed(_ sender: UIButton) {
            let userAnswer = sender.currentTitle!
            
            let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
            if userGotItRight  {
                sender.backgroundColor = UIColor.green
            }else{
                sender.backgroundColor = UIColor.red
            }
        
            quizBrain.nextQuestion()
            
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        answerButton0.setTitle(answerChoices[0], for: .normal)
        answerButton1.setTitle(answerChoices[1], for: .normal)
        answerButton2.setTitle(answerChoices[2], for: .normal)
            
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        answerButton0.backgroundColor = UIColor.clear
       answerButton1.backgroundColor = UIColor.clear
       answerButton2.backgroundColor = UIColor.clear

    }
}

