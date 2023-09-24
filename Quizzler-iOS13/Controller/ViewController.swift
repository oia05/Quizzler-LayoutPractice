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
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionTextView: UILabel!
    
    private var questionBrain = QuestionBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        setProgress()
        updateQuestion()
        setScore()
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        let answer = sender.currentTitle ?? ""
        if questionBrain.check(answer: answer) {
            sender.backgroundColor = UIColor.green
            answeredCorrectly()
        } else {
            sender.backgroundColor = UIColor.red
            answeredFalsely()
        }
    }
    
    private func updateQuestion() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
            self.questionTextView.text = self.questionBrain.getQuestionText()
        })
    }
    
    private func setProgress() {
        progressBarView.progress = questionBrain.getProgress()
    }
    
    private func setScore() {
        scoreLabel.text = "Score: \(questionBrain.getScore())"
    }
    
    private func answeredCorrectly() {
        questionBrain.nextQuestion()
        setProgress()
        setScore()
        updateQuestion()
    }
    
    private func answeredFalsely() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        })
    }
}

