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
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    private var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    @IBAction func answerClicked(_ sender: UIButton) {
        guard let answer = sender.titleLabel?.text else {return}
        let isCorrect = quizBrain.answerQuestion(answer)
        showResult(isCorrect: isCorrect, sender: sender)
        updateQuestion()
    }
    
    private func showResult(isCorrect: Bool, sender: UIButton) {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        if(isCorrect) {
            answeredCorrectly(sender: sender)
        } else {
            answeredIncorrectly(sender: sender)
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { _ in
            sender.backgroundColor = .clear
        })
    }
    
    private func answeredCorrectly(sender: UIButton) {
        sender.backgroundColor = .green
    }
    
    private func answeredIncorrectly(sender: UIButton) {
        sender.backgroundColor = .red
    }
    
    private func updateQuestion() {
        quizBrain.nextQuestion()
        updateUi()
    }
    
    private func updateUi() {
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
        
    
}

