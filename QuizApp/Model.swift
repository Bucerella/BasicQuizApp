//
//  Model.swift
//  QuizApp
//
//  Created by Buse ERKUŞ on 17.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import Foundation
import UIKit

struct QuizQuestion {
    
    var correctAnswer: Bool
    var question: String
    var image: UIImage
}

class Quiz{
   private var question: [QuizQuestion] =
        [
         QuizQuestion(correctAnswer: true, question: "Is this a tree?", image: #imageLiteral(resourceName: "tree")),
         QuizQuestion(correctAnswer: false, question: "Is this a dog?", image: #imageLiteral(resourceName: "car")),
         QuizQuestion(correctAnswer: false, question: "Is this a person?", image: #imageLiteral(resourceName: "mug")),
        QuizQuestion(correctAnswer: true, question: "Is this a chocolate?", image: #imageLiteral(resourceName: "choca")),
            QuizQuestion(correctAnswer: true, question: "Is this a candy?", image: #imageLiteral(resourceName: "candy")),
            QuizQuestion(correctAnswer: false, question: "Is this a erase?", image: #imageLiteral(resourceName: "heart"))



        ]
    private var score: Int = 0
    private var questionIndex: Int = 0
    
    func getScore() -> String{
        
        return "\(score) \\ \(question.count)"
    
    }
    func getQuestion() -> QuizQuestion{
        return question[questionIndex]
    }
    func checkAnswer(answer:Bool) -> Bool{
        let question = getQuestion()
        
        if question.correctAnswer == answer {
            score += 1
            return true
        }
        return false
    }
    func nextQuestion() -> Bool {
        questionIndex += 1
        
        if questionIndex > question.count - 1{
            return false
        }
        return true
    }
    func reset() {
        questionIndex = 0
    }
}
