//
//  TrainViewController.swift
//  MathTrainerlesson_2
//
//  Created by Katerina on 11/11/2023.
//

import Foundation
import UIKit


final class TrainViewController: UIViewController {
    @IBOutlet var backButton: UIButton!
    @IBOutlet var answerOneButton: UIButton!
    @IBOutlet var answerTwoButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    
    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
             switch type {
                       case .add:
                           sign = "+"
                       case .divide:
                           sign = "÷"
                       case .multiply:
                           sign = "×"
                       case.subtract:
                           sign = "-"
                       }
                   }
               }
    private var firstNumber = 0
    private var secondNumber = 0
    private var sign = ""
    private var count = 0
 
    var answer: Int {
        switch type {
        case .add:
            return firstNumber + secondNumber
        case .divide:
            return firstNumber / secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .subtract:
            return firstNumber - secondNumber
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        configureQuestion()
        let isRightButton = Bool.random()
        var randomAnswer: Int
        repeat {
            randomAnswer = Int.random(in: (answer - 10)...(answer + 10))
        } while randomAnswer == answer
        
        answerOneButton.setTitle(isRightButton ? String(answer) : String(randomAnswer), for: .normal)
        answerTwoButton.setTitle(isRightButton ? String(randomAnswer) : String(answer), for: .normal)
    }
    
    // MARK: - IBActions
    
    @IBAction func leftActions(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    @IBAction func rightAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    // MARK:- Methods
    private func configureQuestion() {
            firstNumber = Int.random(in: 1...99)
            secondNumber = Int.random(in: 1...99)
            
        let question = "\(firstNumber) \(sign) \(secondNumber) ="
            questionLabel.text = question
            
        }
    private func check(answer: String, for button: UIButton) {
        let isRightAnswer = Int(answer) == self.answer
        button.backgroundColor = isRightAnswer ? .green : .red
        
        if isRightAnswer {
            count += 1
            configureQuestion()
        }
        
    }

}

