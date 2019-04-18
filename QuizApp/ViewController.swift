//
//  ViewController.swift
//  QuizApp
//
//  Created by Buse ERKUŞ on 17.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
       
    }
    
    func setupQuestion(){
        let currentQuestion = quiz.getQuestion()
        
        imgView.image = currentQuestion.image
        quizLabel.text = currentQuestion.question
    }
    @IBAction func trueBtn(_ sender: Any) {
        
        let result = quiz.checkAnswer(answer: true)
        showAlert(isCorrect: result)
    }
    @IBAction func falseBtn(_ sender: Any) {
        let result = quiz.checkAnswer(answer: false)
        showAlert(isCorrect: result)
    }
    
    func showAlert(isCorrect correct: Bool){
     
        let title = correct ? "Correct" : "Incorrect"
        
        let message = correct ? "You got the true answer" : "You got the false answer"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
        let nextQuestionAction = UIAlertAction(title: "Next Question", style: .default) { (action) in
            
            if self.quiz.nextQuestion(){
                
                self.setupQuestion()
                alert.dismiss(animated: true, completion: nil)
            }else{
                alert.dismiss(animated: true, completion: nil)
                self.finalScore()
            }
         
        }
        alert.addAction(nextQuestionAction)
        present(alert,animated: true,completion: nil)
    }
    func finalScore(){
        let alert = UIAlertController(title: "Final Score", message: "\(quiz.getScore())", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default) { (action) in
            self.quiz.reset()
            self.setupQuestion()
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okBtn)
        present(alert, animated: true,completion: nil)
    }
    
}

